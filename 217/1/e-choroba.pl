#!/usr/bin/env perl
use warnings;
use strict;
use experimental qw( signatures );

srand 1;

sub sorted_matrix($m) {
    (sort { $a <=> $b } map @$_, @$m)[2]
}

sub sorted_matrix_sliding_window($m) {
    my $iter = iter($m);
    my @window = sort { $a <=> $b } map $iter->(), 1 .. 3;
    while (defined( my $e = $iter->() )) {
        if (my $count = grep $e < $_, @window) {
            splice @window, -$count, 0, $e;
            pop @window;
        }
    }
    return $window[2]
}

sub iter($m) {
    my ($x, $y) = (0, 0);
    return sub() {
        return if $x > $#$m;
        my $e = $m->[$x][$y];
        $y = 0, ++$x if ++$y > $#$m;
        return $e
    }
}


use Test::More tests => 3 + 1;

is sorted_matrix([[3, 1, 2], [5, 2, 4], [0, 1, 3]]), 1, 'Example 1';
is sorted_matrix([[2, 1], [4, 5]]), 4, 'Example 2';
is sorted_matrix([[1, 0, 3], [0, 0, 0], [1, 2, 1]]), 0, 'Example 3';
is sorted_matrix_sliding_window([[1, 0, 3], [0, 0, 0], [1, 2, 1]]), 0, 'Example 3x';
