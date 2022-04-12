#!/usr/bin/env perl
#
# Write a script to accept a positive number as command line argument and print
# the smallest multiple of the given number consists of digits 0 and 1.

use v5.30;
use warnings;

my $n = 55;

my $multiple = $n;
while ($multiple !~ /^[01]+$/) {
    $multiple += $n;
}

say $multiple;
