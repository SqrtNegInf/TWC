#!/usr/bin/env perl
use v5.36;
use bigint;

sub task1 ($n) {
    return oct '0b' . sprintf('%b', $n) =~ tr/01/10/r;
}

my @tests = (
    [ 5, 2 ],
    [ 4, 3 ],
    [ 6, 1 ],
    #[ 2**64+1, 2**64-2 ], # nope
);
use Test::More;
plan tests => 0+@tests;
for (@tests) {
    my ( $in, $expected ) = @{$_};
    is task1($in), $expected, "task1($in) == $expected";
}
