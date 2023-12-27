#!/usr/bin/env perl

use v5.36;

sub submatrix_sum($m) {
    my @r;
    for my $i (0 .. $#$m - 1) {
        for my $j (0 .. $#{ $m->[0] } - 1) {
            for my $k (0, 1) {
                for my $l (0, 1) {
                    $r[$i][$j] += $m->[ $i + $k ][ $j + $l ];
                }
            }
        }
    }
    return \@r
}

use Test::More;

is_deeply submatrix_sum([[1,  2,  3,  4],
                  [5,  6,  7,  8],
                  [9, 10, 11, 12]]),
    [[14, 18, 22],
     [30, 34, 38]],
    'Example 1';


is_deeply submatrix_sum([[1, 0, 0, 0],
                  [0, 1, 0, 0],
                  [0, 0, 1, 0],
                  [0, 0, 0, 1]]),
    [[2, 1, 0],
     [1, 2, 1],
     [0, 1, 2]],
    'Example 2';

done_testing;
