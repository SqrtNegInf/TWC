#!/usr/bin/env raku

my @matrix1 = [
    [1, 0, 1],
    [1, 1, 1],
    [1, 1, 1]
];

my @matrix2 = [
    [1, 0, 1],
    [1, 1, 1],
    [1, 0, 1]
];

sub zero-matrix(@matrix, $m, $n) {
    my @zero-entries = [];
    for ^$m X ^$n -> ($i, $j) {
        if (@matrix[$i][$j] == 0) {
            @zero-entries.push([$i, $j]);
        }
    }

    for @zero-entries -> ($i, $j) {
        for ^$m -> $k {
            @matrix[$k][$j] = 0;
        }
        for ^$n -> $l {
            @matrix[$i][$l] = 0;
        }
    }

    return @matrix;
}

.say for zero-matrix(@matrix1, 3, 3);
say '';
.say for zero-matrix(@matrix2, 3, 3);
