#!/usr/bin/env raku

use Test;

my @Test =
     "perl",        30,
     "hello",       13,
     "raku",        37,
;
plan @Test ÷ 2;


sub task( $a) {
    $a.comb».ord.rotor(2 => -1).map( { abs( .[0] - .[1])}).sum;
}

for @Test -> $in, $exp {
    is task($in), $exp, "$exp <- $in";
}
done-testing;
