#!/usr/bin/env raku

use Test;

my @Test =
    [,], Int,
    [1, 2],                      5,
    [1, 2, 3, 4],               21,
    [2, 7, 1, 19, 18, 3],       63,
    [1, 2, 3, 4, 5, 6],         50,
    [1, 2, 3, 4, 5, 6, 7],      50,
    [1, 2, 3, 4, 5, 6, 7, 8],   85,
    [100, 100],                 20000,
;
plan @Test ÷ 2;

multi func( @a where * ~~ Empty) { Int }
multi func( @a ) {
    sum @a[ ( ^@a.elems +1).grep( @a.elems %% *).map( * -1)].map: *²;
}

for @Test -> @in, $exp {
    is func(@in), $exp, $exp//"Int" ~ " <- @in.raku()";
}
done-testing;

my @int = (2, 7, 1, 19, 18, 3);
say "\nInput: @int = @int[]\nOutput: ",func(@int);
