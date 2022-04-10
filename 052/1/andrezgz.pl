#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-052/
# Task #1
#
# Stepping Numbers
# Write a script to accept two numbers between 100 and 999.
# It should then print all Stepping Numbers between them.
#
# A number is called a stepping number if the adjacent digits
# have a difference of 1. For example, 456 is a stepping number
# but 129 is not.

use strict;
use warnings;
use v5.10;

my ( $begin, $end ) = (111,999);
($begin, $end) = ($end, $begin) if $end < $begin;

for ($begin .. $end) {
    my @d = split //;
    next if abs($d[0] - $d[1]) != 1 ||
            abs($d[1] - $d[2]) != 1;
    say $_;
}
