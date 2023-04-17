#!/usr/bin/env perl
use v5.36;

sub rearrange_groups_naive($list, $size) {
    return -1 if @$list % $size;

    my %freq;
    ++$freq{$_} for @$list;
    my @sorted = sort { $a <=> $b } keys %freq;
    my @groups;
    while (@sorted) {
        for my $i (1 .. $size - 1) {
            return -1 if $sorted[$i] != 1 + $sorted[ $i - 1 ];
        }
        push @groups, [map $sorted[0] + $_, 0 .. $size - 1];
        for my $i (reverse 0 .. $size - 1) {
            delete $freq{ splice @sorted, $i, 1 }
                if 0 == --$freq{ $sorted[$i] };
        }
    }
    return \@groups
}

# Optimised version: Remove all occurrences of a repeated group at
# once.
sub rearrange_groups($list, $size) {
    return -1 if @$list % $size;

    my %freq;
    ++$freq{$_} for @$list;
    my @sorted = sort { $a <=> $b } keys %freq;
    my @groups;
    while (@sorted) {
        for my $i (1 .. $size - 1) {
            return -1 if $sorted[$i] != 1 + $sorted[ $i - 1 ]
                      || $freq{ $sorted[0] } > $freq{ $sorted[$i] };
        }
        my @group = map $sorted[0] + $_, 0 .. $size - 1;
        push @groups, map [@group], 1 .. $freq{ $sorted[0] };
        for my $i (reverse 0 .. $size - 1) {
            $freq{ $sorted[$i] } -= $freq{ $sorted[0] };
            delete $freq{ splice @sorted, $i, 1 } if 0 == $freq{ $sorted[$i] };
        }
    }
    return \@groups
}

use Test2::V0 -srand => 1;
plan 5;

is rearrange_groups([1, 2, 3, 5, 1, 2, 7, 6, 3], 3),
    [[1, 2, 3], [1, 2, 3], [5, 6, 7]],
    'Example 1';

is rearrange_groups([1,2,3], 2),
    -1,
    'Example 2';

is rearrange_groups([1, 2, 4, 3, 5, 3], 3),
    [[1, 2, 3], [3, 4, 5]],
    'Example 3';

is rearrange_groups([1, 5, 2, 6, 4, 7], 3),
    -1,
    'Example 4';

is rearrange_groups([1, 2, 3, 1, 2, 3, 2, 3, 4], 3),
    [[1, 2, 3], [1, 2, 3], [2, 3, 4]],
    'More overlap';
