#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

sub min_max (@ints) {
    my $first = shift @ints;
    my $pair  = reduce {
        my ($min, $max) = @{$a};
        [$min < $b ? $min : $b, $max > $b ? $max : $b]
    } [$first, $first], @ints;
    return @{$pair};
}

sub neither_min_nor_max (@ints) {
    my ($min, $max) = min_max(@ints);
    return grep { $_ != $min && $_ != $max } @ints;
}

sub to_string (@array) {
    return @array == 0 ? -1 : '(' . join(', ', @array) . ')';
}

say to_string(neither_min_nor_max(3, 2, 1, 4));
say to_string(neither_min_nor_max(3, 1));
say to_string(neither_min_nor_max(2, 1, 3));
