#!/usr/bin/env perl
use v5.36;

use Test::More;

sub reduce($ints) {
   return map { split '' } @$ints
}

is_deeply([reduce([1, 34, 5, 6])], [1, 3, 4, 5, 6], "ok?");
is_deeply([reduce([1, 24, 51, 60])], [1, 2, 4, 5, 1, 6, 0], "ok?");

done_testing(2)
