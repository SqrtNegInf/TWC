#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-051/
# Task #2
#
# Colourful Number
# Write a script to display all Colorful Number with 3 digits.
#
# A number can be declare Colorful Number where all the products of consecutive
# subsets of digit are different.
#
# For example, 263 is a Colorful Number since 2, 6, 3, 2x6, 6x3, 2x6x3 are unique.

use strict;
use warnings;

for my $n (100 .. 999) {
    my %unique;
    my ($f,$s,$t) = split //, $n;
    @unique{$f, $s, $t, $f*$s, $s*$t, $f*$s*$t} = (1) x 6;
    print $n.$/ if keys %unique == 6;
}
