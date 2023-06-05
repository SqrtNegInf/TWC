#!/usr/bin/env perl
use v5.36;

my $s = 6; my @list = <1 2 4>;

#
# my @ways = findall( $s, $coins, $used );
#	Find all possible ways of achieving sum $s given @$coins.  %$used
#	is the bag of all coins used so far.  Returns @ways, an array of
#	each complete %$used bag.
#
sub findall( $s, $coins, $used )
{
	my @result;
	foreach my $c (@$coins)
	{
		next if $c > $s;	# coin too big..
		my %u2 = %$used;	# make bag u2: used + 1 more $c
		$u2{$c}++;
		if( $c == $s )
		{
			push @result, \%u2;
		} else
		{
			# 2 possibilities: either include zero or one more $c
			# zero: remove $c from copy of @$coins
			my @c2 = grep { $_ ne $c } @$coins;
			
			push @result, findall( $s, \@c2, $used );

			# one more:
			push @result, findall( $s-$c, $coins, \%u2 );
		}
	}
	return @result;
}

#
# my $csv = h2c( %h );
#	Turn a bag %h into a CSV string of (c1) x n1, (c2) x n2..
#
sub h2c( %h )
{
	my @result;
	foreach my $c (sort keys %h)
	{
		push @result, (($c) x $h{$c});
	}
	return join(',',@result);
}


my @ways = map { h2c(%$_) } findall( $s, \@list, {} );
my @uniqueways;
my %seen;
foreach my $w (sort @ways)
{
	push @uniqueways, $w unless $seen{$w}++;
}
my $n = @uniqueways;
say "There are $n possible ways to make sum $s";
say for @uniqueways;
