#!/usr/bin/env raku

use Test;

my @Test =
    # in                exp
    (8, 1, 2, 2, 3),    (4, 0, 1, 1, 3),
    (6, 5, 4, 8),       (2, 1, 0, 3),
    (2, 2, 2),          (0, 0, 0),
;
plan @Test ÷ 2;

sub func( @a --> Array) {
   @a.map( { @a.grep( * < $_).Int}).Array;
}

for @Test -> @in, @exp {
    is func(@in), @exp, "@in.raku() -> @@exp.raku()";
}

my @int = 1,2,7,9,4,0,-1;

say "\nInput: @int = @int[]\nOutput: ", func @int;

