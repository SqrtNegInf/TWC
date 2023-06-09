#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

my @ARGV = (2,3,4);

my @bits = map {pack 'Q', $_} @ARGV;
my $sum;
while (defined (my $bits = shift @bits)) {
	$sum += unpack '%64b*', $bits ^. $_ foreach @bits;
}
print $sum, "\n";
