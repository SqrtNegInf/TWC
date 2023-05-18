#!/usr/bin/env perl
use v5.36;

#
# Trivial solution. Will easily out of memory.
#
# We'll calculate all number n * m, 1 <= n <= i, 1 <= m <= j, sort them,
# and then take the kth element.
#

#while (<>) {
    my ($i, $j, $k) = split ' ', '1000 999 314159';
    say +(sort {$a <=> $b} map {my $l = $_; map {$_ * $l} 1 .. $j} 1 .. $i)[$k - 1];
#}

