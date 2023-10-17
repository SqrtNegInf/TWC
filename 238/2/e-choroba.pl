#!/usr/bin/env perl
use v5.36;

use List::Util qw{ product };

sub persistence_sort(@int) {
    return [ sort { steps($a) <=> steps($b) || $a <=> $b } @int ]
}

sub steps($n) {
    my $steps = 0;
    while (length($n) > 1) {
        my @digits = split //, $n;
        $n = product(@digits);
        ++$steps
    }
    return $steps
}

use Test::More;

is_deeply persistence_sort(15, 99, 1, 34), [1, 15, 34, 99], 'Example 1';
is_deeply persistence_sort(50, 25, 33, 22), [22, 33, 50, 25], 'Example 2';
done_testing;
