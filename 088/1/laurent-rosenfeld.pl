#!/usr/bin/env perl
use v5.36;

my @tests = ([5, 2, 1, 4, 3], [2, 1, 4, 3]);
for my $array_ref (@tests) {
    my $product = 1;
    $product *= $_ for @$array_ref;
    my @result = map $product / $_, @$array_ref;
    say "Input: @$array_ref";
    say "Result: @result";
}
