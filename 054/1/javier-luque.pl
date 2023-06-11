#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(permutations);

my ($n,$k) = (3,4);

my @data = 1 .. $n;
my @all_permutations = permutations(\@data);
say join '', @{$all_permutations[$k - 1]};
