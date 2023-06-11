#!/usr/bin/env perl
use v5.36;

my $n = 23;

if( $n>0 )
{
	my @seq = collatz( $n );
	say "collatz $n = ", join(',', @seq);
} else
{
	# find longest 20 sequences for x=1..n
	my @longest20;	# array of [ len, sequence ]

	foreach my $x (1..-$n)
	{
		my @seq = collatz( $x );
		my $len = @seq;
		push @longest20, [ $len, @seq ];
		@longest20 = sort { $b->[0] <=> $a->[0] } @longest20;
		$#longest20 = 19 if @longest20>20;
		#say "x=$x longest: ", join(',',@$_) for @longest20;
	}

	say "longest 20 collatz sequences:";
	foreach my $longest (@longest20)
	{
		my( $len, @seq ) = @$longest;
		say "len=$len: ", join(',',@seq);
	}
}


#
# my @seq = collatz( $n );
#	Generate the collatz sequence for $n.
#	Rules are:
#		stop when $n==1
#		$n = $n / 2 when $n is even
#		$n = 3*$n + 1 when $n is odd
# 
#
sub collatz( $n )
{
	my @seq = ( $n );
	while( $n != 1 )
	{
		if( $n%2==0 ) { $n = $n / 2 } else { $n = 3*$n + 1 }
		push @seq, $n;
	}
	return @seq;
}
