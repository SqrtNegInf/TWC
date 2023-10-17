#!/usr/bin/env perl
use v5.36;

sub running_sum(@int) {
    my @running_sum = shift @int;
    push @running_sum, $running_sum[-1] + shift @int while @int;
    return \@running_sum
}

use Test::More;

is_deeply running_sum(1, 2, 3, 4, 5), [1, 3, 6, 10, 15], 'Example 1';
is_deeply running_sum(1, 1, 1, 1, 1), [1, 2, 3, 4, 5], 'Example 2';
is_deeply running_sum(0, -1, 1, 2), [0, -1, 0, 2], 'Example 3';
done_testing;
