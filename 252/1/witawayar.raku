#!/usr/bin/env raku
my &fun = { @^ints.kv.map({ $^value ** 2 if +@ints %% $^index.succ }).sum }

use Test;
my @tests of Pair =
    (1, 2, 3, 4) => 21,
    (2, 7, 1, 19, 18, 3) => 63;

for @tests -> (:key($input), :value($expected-output)) {
    ok fun($input) eqv $expected-output;
    LAST done-testing;
}
