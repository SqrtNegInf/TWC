#!/usr/bin/env perl

# expects input in @ARGV
# prints result to STDOUT
# numbers must be in the range 0 .. 2**64 - 1

use strict;
use warnings;
use List::Util qw(reduce);

my @ARGV = (2,3,4);

my @bits = map {pack 'Q', $_} @ARGV;
my $sum;
while (defined (my $bits = shift @bits)) {
	$sum += unpack '%64b*', $bits ^ $_ foreach @bits;
}
print $sum, "\n";
