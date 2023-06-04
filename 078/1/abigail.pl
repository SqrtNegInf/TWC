#!/usr/bin/env perl
use v5.36;

#
# Exercise:
#    You are given an array @A containing distinct integers.
#    Write a script to find all leader elements in the array @A.
#    Print (0) if none found. An element is leader if it is greater
#    than all the elements to its right side.
#

my $max;

#
# Read the input, extract integers, and store them in @A.
# If the input is empty, print 0 and exit.
#
say 0, exit unless my @A = <DATA> =~ /[0-9]+/g;

local $, = " ";

#
# Reverse the array, and extract each element which was larger
# than any seen before (keep state in $max), then reverse it
# again before printing.
#

say reverse
    grep {!defined $max || $_ > $max ? do {$max = $_; 1} : 0}
    reverse @A;

__END__
9 10 7 5 6 1
