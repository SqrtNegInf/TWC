#!/usr/bin/env perl
use v5.36;

sub build_array(@int) { [@int[@int]] }

use Test::More;

is_deeply build_array(0, 2, 1, 5, 3, 4), [0, 1, 2, 4, 5, 3], 'Example 1';
is_deeply build_array(5, 0, 1, 2, 3, 4), [4, 5, 0, 1, 2, 3], 'Example 2';
done_testing;
