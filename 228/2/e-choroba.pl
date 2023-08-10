#!/usr/bin/env perl
use v5.36;

sub empty_array(@int) {
    my $steps = 0;
    my @sorted = sort { $a <=> $b } @int;
    while (@int) {
        if ($sorted[0] == $int[0]) {
            shift @sorted;
            shift @int;
        } else {
            push @int, shift @int;
        }
        ++$steps;
    }
    return $steps
}

use List::Util qw{ min };
sub empty_array_min(@int) {
    my $steps = 0;
    while (@int) {
        if (min(@int) == $int[0]) {
            shift @int;
        } else {
            push @int, shift @int;
        }
        ++$steps;
    }
    return $steps
}

use Test::More tests => 2 * 2;

is empty_array(3, 4, 2), 5, 'Example 1';
is empty_array(1, 2, 3), 3, 'Example 2';
is empty_array_min(3, 4, 2), 5, 'Example 1 min';
is empty_array_min(1, 2, 3), 3, 'Example 2 min';
