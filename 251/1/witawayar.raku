#!/usr/bin/env raku
my &fun = { (@^ints Z~ @^ints.reverse)[^(* div 2)].sum + (@^ints[* div 2] if @^ints !%% 2) }

use Test;
my @tests of Pair =
    (6, 12, 25, 1) => 1286,
    (10, 7, 31, 5, 2, 2) => 489,
    (1, 2, 10) => 112;

for @tests -> (:key($input), :value($expected-output)) {
    ok fun($input) eqv $expected-output;
    LAST done-testing;
}
