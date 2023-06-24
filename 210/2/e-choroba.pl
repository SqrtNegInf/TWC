#!/usr/bin/env perl
use v5.36;

sub number_collision(@list) {
    while (1) {
        my $changed;
        my @new = @list;
        for (my $i = 0; $i <= $#list; ++$i) {
            if ($list[$i] > 0 && $i < $#list && $list[ $i + 1 ] <= 0) {
                @new[$i, $i + 1] = (
                    undef,
                    (undef, @list[$i, $i + 1])[
                        abs $list[$i] <=> abs $list[ $i + 1 ]]);
                ++$i;
                $changed = 1;
            } elsif ($list[$i] == 0 && $i < $#list && $list[ $i + 1 ] < 0) {
                @new[$i, $i + 1] = (undef, $list[ $i + 1 ]);
            }
        }
        @list = grep defined, @new;
        last unless $changed
    }
    return \@list
}

use Test2::V0 -srand => 1;
plan 3 + 3;

is number_collision(2, 3, -1), [2, 3], 'Example 1';
is number_collision(3, 2, -4), [-4], 'Example 2';
is number_collision(1, -1), [], 'Example 3';

is number_collision(0, 0), [0, 0], 'Only zeroes';
is number_collision(1, 0), [1], "Zeroes don't move positive";
is number_collision(0, -1), [-1], "Zeroes don't move negative";
