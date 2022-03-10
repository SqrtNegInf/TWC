#!/usr/bin/env perl

use strict;
use warnings;

my $n = shift // 1234;
die "Input must be positive\n" if $n < 1;

# Increase n until we have a new palindrome
do { ++$n; } until $n eq reverse $n;
print "$n\n";
