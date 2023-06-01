#!/usr/bin/env perl
use v5.36;

#
# Challenge
#
# You are given an array of positive integers @N.
#
# Write a script to return an array @M where $M[i] is the product of
# all elements of @N except the index $N[i].
#

#
# We first calculate the result for M [0], by multiplying all
# numbers N [1 ..]. Then, for each i > 0, we calculate M [i] as
#
#      M [i] = (M [i - 1] / N [i]) * N [i - 1]
#
# Assuming the challenge is created such that each M [i] fits in an
# integer, this will not result in an overflow, as long as we first do
# the division, then the multiplication.
# Note that N [i] evenly divides M [i - 1] by definition.
#

use List::Util qw [product];

while (<DATA>) {
    # Read in a line of data.
    my @N = /[1-9][0-9]*/g;
    # Calculate M [0], and print it.
    printf "%d", my $P = product @N [1 .. $#N];
    # For each i > 0, calculate M [i] from M [i - 1], N [i] and N [i - 1],
    # and print it.
    printf ", %d", $P = $P / $N [$_] * $N [$_ - 1] for 1 .. $#N;
    print "\n";
}


__END__
5 2 1 4 3
2 1 4 3
1073741824 536870912 2147483648
