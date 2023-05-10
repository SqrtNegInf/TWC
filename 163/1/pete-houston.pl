#!/usr/bin/env perl
use v5.36;

use List::Util 1.55 'uniqint';
use Math::Combinatorics;

# Extract nCr with r = 2
my $combo = Math::Combinatorics->new (
	count => 2,
	data  => [uniqint @ARGV]
);

my $tot = 0;
while (my @c = $combo->next_combination) {
	$tot += $c[0] & $c[1];
}

print "$tot\n";
