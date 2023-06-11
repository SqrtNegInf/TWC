#!/usr/bin/env perl
use v5.36;

my $b = '100110011';
die "flip-binary: b $b must be non-empty [01]+\n" unless $b =~ /^[01]+$/;

my $maxbit = length($b)-1;

my $longest = -1;
my @longestlrs;

foreach my $l (0..$maxbit)
{
	foreach my $r ($l..$maxbit)
	{
		my $flippedbinstr = flip( $b, $l, $r );
		my $ones = ($flippedbinstr =~ tr/1//);
		#say "flip $b $l $r == $flippedbinstr, $ones ones";
		if( $ones > $longest )
		{
			@longestlrs = ( [$l,$r,$flippedbinstr] );
			$longest = $ones;
		} elsif( $ones == $longest )
		{
			push @longestlrs, [$l,$r,$flippedbinstr];
		}
	}
}

say "for $b, longest no ones=$longest";
foreach my $lr (@longestlrs)
{
	my( $l, $r, $f ) = @$lr;
	say " $l..$r: $f";
}



#
# my $flippedbinstr = flip( $binstr, $l, $r );
#	Given a binary string $binstr, and bit positions $l and $r
#	(each in range 0..length(binstr)-1), flip bits between positions
#	$l..$r and return the "flipped binary string".
#
sub flip( $binstr, $l, $r )
{
	my $maxbit = length($binstr)-1;
	die "flip: l $l must be 0..$maxbit\n" unless $l>=0 && $l<=$maxbit;
	die "flip: r $r must be 0..$maxbit\n" unless $r>=0 && $r<=$maxbit;
	die "flip: r $r must be >= l $l\n" unless $r>=$l;
	for( my $pos=$l; $pos<=$r; $pos++ )
	{
		my $bit = substr($binstr,$pos,1);
		$bit = 1-$bit;
		substr( $binstr,$pos,1 ) = $bit;
	}
	return $binstr;
}


