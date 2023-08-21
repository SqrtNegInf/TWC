#!/usr/bin/env perl
use v5.36;

sub separate_digits(@ints) {
    [map split(//), @ints]
}

use Test::More;

is_deeply separate_digits(1, 34, 5, 6), [1, 3, 4, 5, 6], 'Example 1';
is_deeply separate_digits(1, 24, 51, 60), [1, 2, 4, 5, 1, 6, 0], 'Example 2';
done_testing;
