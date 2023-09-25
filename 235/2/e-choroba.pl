#!/usr/bin/env perl
use v5.36;

sub duplicate_zeros(@ints) {
    my @d;
    for my $int (@ints) {
        push @d, ($int) x (1 + (0 == $int));
        last if @d > @ints
    }
    return [@d[0 .. $#ints]]
}

sub duplicate_zeros_laconic(@ints) {
    [(map +($_) x (1 + (0 == $_)), @ints)[0 .. $#ints]]
}

use Test::More;

for my $d (*duplicate_zeros{CODE}, *duplicate_zeros_laconic{CODE}) {
    is_deeply $d->(1, 0, 2, 3, 0, 4, 5, 0), [1, 0, 0, 2, 3, 0, 0, 4], 'Example 1';
    is_deeply $d->(1, 2, 3), [1, 2, 3], 'Example 2';
    is_deeply $d->(0, 3, 0, 4, 5), [0, 0, 3, 0, 0], 'Example 3';
}

done_testing;
