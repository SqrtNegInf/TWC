#!/usr/bin/env raku

use Test;

my @Test =
    [,],            [,],
    [0,],           [0,],
    [1,34,5,6],     [1,3,4,5,6],
    [1,24,51,60],   [1,2,4,5,1,6,0],
    [1,1245160,0],  [1,1,2,4,5,1,6,0,0],
;

sub digitize( @i --> Array) { (@i.map( *.Str.comb )).flat.map( *.Int).Array; }

plan 1 + @Test ÷ 2 ;

for @Test -> @in, @exp {
    is digitize(@in), @exp, "@exp.raku() <- @in.raku()";
}
is digitize([1,1] )[0].WHAT, Int, 'Type';

done-testing;

my @int = [1, 34, 5, 6];
say "\nInput: @int = @int.raku()\nOutput: ", digitize( @int).raku();

exit;

