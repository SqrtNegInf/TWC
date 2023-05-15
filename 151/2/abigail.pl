#!/usr/bin/env perl
use v5.36;
use List::Util qw [max];

#
# We'll calculate the best way to rob the houses by working backwards.
# For each house, there are two options: rob the house, or skip it.
# The maximum value we get for robbing the house is the sum of
# the value of the current house, plus the maximum we can get
# if we started two houses down. The maximum value we can get by
# not robbing this house is the best we can get by starting from
# the next house. We'll add two empty houses to make everything work
# out nicely.
#
# Note that we don't have to calculate the best option starting
# from the second house, as we will always skip the second house.
# And we must always pick the first house.
#

while (<DATA>) {
    my @h = (/[0-9]+/g, 0, 0);
    $h [$_] = max $h [$_] + $h [$_ + 2], $h [$_ + 1] for reverse 2 .. $#h - 2;
    say $h [0] + $h [2];
}

__END__
4 2 3 6 5 3
