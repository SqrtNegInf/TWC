#!/usr/bin/env perl

# Task 1: Separate Digits
# Submitted by: Mohammad S Anwar
# 
# You are given an array of positive integers.
# 
# Write a script to separate the given array into single digits.
#
# Example 1
# Input: @ints = (1, 34, 5, 6)
# Output: (1, 3, 4, 5, 6)
# 
# Example 2
# Input: @ints = (1, 24, 51, 60)
# Output: (1, 2, 4, 5, 1, 6, 0)

use strict;
use warnings;

my @input = @ARGV;
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /[\-\d]/ ? () : 1 }
                 @input) != 0;

printf "Output: (%s)\n", join ', ', map { split // }
                                      @input;
