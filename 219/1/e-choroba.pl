#!/usr/bin/env perl
use v5.36;

sub sorted_squares(@list) {
    sort { $a <=> $b } map $_ * $_, @list
}

use Test::More;

is_deeply [sorted_squares(-2, -1, 0, 3, 4)], [0, 1, 4, 9, 16], 'Example 1';
is_deeply [sorted_squares(5, -4, -1, 3, 6)], [1, 9, 16, 25, 36], 'Example 2';
done_testing
