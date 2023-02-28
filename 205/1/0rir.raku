#!/usr/bin/env raku

use Test;

my @Test =
    [,],            (Int),
    [10,],             10,
    [10,20],           20,
    [1,1,1,1,1,20],    20,
    [5,3,4],            3,
    [5,6],              6,
    [5,4,4,3],          3,
    [5,4,3,-17,17,10,10,10,5,1,0,10,5],     5,
;

plan +@Test div 2;

sub third-highest( @a is copy --> Int ) {
    my $triad = @a.sort({$^b <=> $^a}).unique[0..2];
    return $triad[2] // $triad[0] // Int;
}

for @Test -> $in, $exp {
    is third-highest(@$in), $exp, "$in.raku() --> $exp.raku()";
}
done-testing;

my @array = @Test[@Test.end][0].flat;

say "\nInput: @array = @array[]\nOutput: &third-highest(@array)";


