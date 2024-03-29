#!/usr/bin/env perl
use v5.36;

sub same_string($arr1, $arr2) {
    join("", @$arr1) eq join("", @$arr2) ? 'true' : 'false'
}

use Test::More tests => 3;

is same_string(["ab", "c"], ["a", "bc"]), 'true', 'Example 1';
is same_string(["ab", "c"], ["ac", "b"]), 'false', 'Example 2';
is same_string(["ab", "cd", "e"], ["abcde"]), 'true', 'Example 3';
