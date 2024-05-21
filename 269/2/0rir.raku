#!/usr/bin/env raku

use Test; 

my @Test =
    [],  [],
    [0], [0],
    [1], [1],
    [1,2], [1,2],
    [5, 4, 3, 8],       [5, 3, 4, 8],
    [3, 2, 4],          [3, 4, 2],
    [2, 1, 3, 4, 5],    [2, 3, 4, 5, 1],
;

plan @Test ÷ 2;

multi func( [] ) { []}
multi func( @a is copy  where +@a ≤ 1 ) { @a }

multi func( @a is copy  where @a ~~ @a.unique -->Array) {
    $_ := @a;
    my @l .push: .shift;
    my @r .push: .shift;
    while @a { ( @l.tail > @r.tail  ?? @l !! @r ).push: .shift; }
    @l.append: @r;
}

for @Test -> @in, @exp {
    is func(@in), @exp, "@exp.raku() <- @in.raku()";
}
done-testing;

my @x = [2, 1, 3, 7, 30, 4, 9, -100,  5];

say "\nInput: @int = @x.raku()\nOutput: &func( @x).raku()";
