#!/usr/bin/env raku

sub flip1 { +!$^n }
sub flip2 { ($^n + 1) mod 2 } # Different approach

sub task1 (@matrix) {
    return @matrix.map:
        *.reverse.map(&flip1).List;
}

sub task2 (@matrix) {
    return @matrix.map:
        *.reverse.map(&flip2).List;
}


my @tests =
    {
        in       => ((1, 1, 0), (1, 0, 1), (0, 0, 0)),
        expected => ((1, 0, 0), (0, 1, 0), (1, 1, 1)),
    },
    {
        in       => ((1, 1, 0, 0), (1, 0, 0, 1), (0, 1, 1, 1), (1, 0, 1, 0)),
        expected => ((1, 1, 0, 0), (0, 1, 1, 0), (0, 0, 0, 1), (1, 0, 1, 0)),
    },
;
use Test; plan 2 * +@tests;
for @tests {
    is-deeply task1(.<in>), .<expected>;
    is-deeply task2(.<in>), .<expected>;
}
