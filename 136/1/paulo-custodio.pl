#!/usr/bin/env perl
use v5.36;

# Challenge 136
#
# TASK #1 > Two Friendly
# Submitted by: Mohammad S Anwar
# You are given 2 positive numbers, $m and $n.
#
# Write a script to find out if the given two numbers are Two Friendly.
#
# Two positive numbers, m and n are two friendly when gcd(m, n) = 2 ^ p
# where p > 0. The greatest common divisor (gcd) of a set of numbers is
# the largest positive number that divides all the numbers in the set
# without remainder.
#
# Example 1
#     Input: $m = 8, $n = 24
#     Output: 1
#
#     Reason: gcd(8,24) = 8 => 2 ^ 3
# Example 2
#     Input: $m = 26, $n = 39
#     Output: 0
#
#     Reason: gcd(26,39) = 13
# Example 3
#     Input: $m = 4, $n = 10
#     Output: 1
#
#     Reason: gcd(4,10) = 2 => 2 ^ 1

use ntheory 'gcd';

say is_power_2(gcd( (8, 24) ));

sub is_power_2 {
    my($n) = @_;
    my $p = 2;
    while ($p <= $n) {
        return 1 if $p==$n;
        $p *= 2;
    }
    return 0;
}
