#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-056/
# Task #1
#
# Diff-K
# You are given an array @N of positive integers (sorted) and another non negative integer k.
#
# Write a script to find if there exists 2 indices i and j such that A[i] - A[j] = k and i != j.
#
# It should print the pairs of indices, if any such pairs exist.
#
# Example:
#
#     @N = (2, 7, 9)
#     $k = 2
# Output : 2,1

use strict;
use warnings;

#my $usage = "Usage: $0 <sum> <n1> <n2> ...\n";

my $k = 2;
my @sorted = sort {$a <=> $b } (2, 7, 9);
#die $usage if @sorted < 2;

OUT: for my $i (reverse 0 .. @sorted - 1) {
    for my $j (reverse 0 .. $i-1) {
        next OUT if $sorted[$i] - $sorted[$j] > $k; #avoid checking further
        print "($i,$j)\n"  if $sorted[$i] - $sorted[$j] == $k;
    }
}
