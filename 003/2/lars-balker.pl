#!/usr/bin/env perl
use v5.36;

my $rows = 10;

my $previous = [];
for (1..$rows) {
    my $next = [];
    $next->[0] = 1; # first number in row is always 1

    # when previous row is at least two long (last index is > 1), start adding sums to new row
    for my $i (1..$#$previous) {
        $next->[$i] = $previous->[$i-1] + $previous->[$i];
    }
    $next->[@$previous] = 1; # and last number is always 1 (index = the length of previous row)
    $previous = $next;
    say "@$next";
}
