#!/usr/bin/env raku
my &fun = { (@^matrix>>.min ∩ ([Z] @^matrix)>>.max).head.key // -1 }

use Test;
my @tests of Pair =
    [[ 3,  7,  8],
     [ 9, 11, 13],
     [15, 16, 17]] => 15,
    [[ 1, 10,  4,  2],
     [ 9,  3,  8,  7],
     [15, 16, 17, 12] ] => 12,
    [[7, 8],
     [1, 2]] => 7,
    [[7, 8],
     [13, 2]] => -1;

for @tests -> (:key($input), :value($expected-output)) {
    ok fun($input) eqv $expected-output;
    LAST done-testing;
}
