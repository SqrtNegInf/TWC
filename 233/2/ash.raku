#!/usr/bin/env raku

sub frequency-sort(@arr) {
    my %freq;
    %freq{$_}++ for @arr;

    my @sorted = @arr.sort: {
        %freq{$^a} <=> %freq{$^b} ||
        $^b <=> $^a
    };

    return @sorted;
}

my @tests =
    (1, 1, 2, 2, 2, 3),
    (2, 3, 1, 3, 2),
    (-1, 1, -6, 4, 5, -6, 1, 4, 1);

say frequency-sort($_) for @tests;
