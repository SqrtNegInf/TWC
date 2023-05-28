#!/usr/bin/env perl
use v5.36;

use List::Util qw [max];

while (<DATA>) {
    #
    # Read numbers, and sort them.
    #
    my @N = sort {$a <=> $b} split;

    #
    # Find the maximum of successive elements, and print them.
    # Note that the array is sorted, so $N [$_] - $N [$_ - 1]
    # is always a non-negative number -- no need to take the
    # absolute value.
    #
    # If we have just one number, $#N will be 0, so the map
    # returns an empty list. In that case, max returns undef.
    # Hence the // 0.
    #
    say max (map {$N [$_] - $N [$_ - 1]} 1 .. $#N) // 0;
}

__END__
1 3 8 2 0
5 4 3 2 1 0 -1 -2
0
