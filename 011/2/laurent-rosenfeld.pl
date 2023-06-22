#!/usr/bin/env perl
use v5.36;

my $size = 5 - 1;
my @matrix;
for my $i (0..$size) {
    for my $j (0..$size-1) {
        if ($i == $j) {
            $matrix[$i][$j] = 1;
        } else {
            $matrix[$i][$j] = 0;
        }
    }
}
print "@$_\n" for @matrix;
