#!/usr/bin/env perl
use v5.36;

use Data::Dumper;
use List::Util qw(sum);

sub digitsum( $x )
{
	my $sum = sum( split(//,$x) );
	return $sum;
}


my( $ndigits, $digitsum ) = (2,10);

my $lo = 10**($ndigits-1);
my $hi = 10*$lo-1;

foreach my $i ($lo..$hi)
{
	next unless digitsum($i) == $digitsum;
	say $i;
}
