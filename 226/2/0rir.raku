#!/usr/bin/env raku

use Test;

my @Test =
    Int, [,],
    0,   [0,0],
    Int, [1,2],
    1,   [1,1],
    Int, [1,5,0,3,5],
    Int, [10, 8, 20],
;

plan @Test ÷ 2;

sub func( @a is copy -->Int) {
    return Int if @a ~~ [];
    return  0  if @a.all == 0;
    return  1  if @a.all == @a[0];
    return Int;
}

for @Test -> $exp, @in {
    is func(@in), $exp, "$exp.raku() <-- @in.raku()"; 
}
done-testing;
