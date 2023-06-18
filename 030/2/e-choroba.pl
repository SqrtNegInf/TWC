#!/usr/bin/env perl
use v5.36;

for my $i (1 .. 10) {
    for my $j ($i .. 10) {
        last if $i + $j > 11;

        for my $k ($j .. 10) {
            last if $i + $j + $k > 12;

            say "$i, $j, $k"
                if $i + $j + $k == 12
#                && 0 == $i * $j * $k % 2
        }
    }
}

