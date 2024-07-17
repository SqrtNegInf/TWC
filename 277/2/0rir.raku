#!/usr/bin/env raku

use Test;

my @Test =
 # exp  in
    Int, List,
    Int, Array,
    0,  (),
    0,  (1,),
    0,  (1,-1),
    4,  (1, 2, 3, 4, 5),
    1,  (5, 7, 1, 7),
    1,  (2, 3),
    0,  (1, 2),
    0,  (1, 30,),
;
plan @Test ÷ 2;

only task( @in -->Int) {
    return Int unless @in.defined;
    my @a = @in.grep( * > 1).unique;
    return 0 if +@a == (0,1).any;
    +@a.combinations(2).grep( { 0 < ($_[0] - $_[1]).abs < $_.min});
}

for @Test -> $exp, @in {
    is task(@in), $exp, "$exp.gist() <- @in.gist()";
}

done-testing;

#    0 < |x - y| < min(x, y).
my @int = ( -9, -7, -5, 0, 0, 1, 1, 2,  5, 7, 8, 8);
say "\nInput: @ints = @int.raku()\nOuput: &task(@int)";

