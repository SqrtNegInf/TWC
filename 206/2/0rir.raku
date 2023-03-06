#!/usr/bin/env raku

use Test;

my @Test =
    ( [,].Array,            0),
    ( Empty.Array,          0),
    ( Array,                0),
    ([1,2],                 1),
    ([0,1,3,2],             2),
    ([2,3,4,1],             4),
    ([1,4,1,4],             5),
    ([4,1,4,4],             5),
    ([4,4,4,4],             8),
    ([1,2,3,4,5,6],         9),
    ([3,4,5,6,9,10],       17),
    ([1,4,5,6,9,10],       15),
    ([1,4,6,10,10,10],     17),

    ([1,2,3,4,5,6,7,8],            16),
    ([1,8,9,10,11,12,33,14,15,16], 51), 
;

multi sub max-sum-of-mins-for-dyads( @a where @a.elems %% 2 --> Int) {
        # sort and take very other one
    sum @a.sort( { $^a <=> $^b })[ (0..@a.end).grep(* %% 2)];
}
multi sub max-sum-of-mins-for-dyads( @a where not *.defined --> Int) { 0 }
multi sub max-sum-of-mins-for-dyads( @a where *.elems == 0  --> Int) { 0 }

plan +@Test;

for @Test -> ( @in, $exp) {
    is max-sum-of-mins-for-dyads( @in), $exp, "@in.raku() => $exp";
}

done-testing;

my @ary = 1,8,9,10,11,12,33,14,15,16;
say "\nInput: @array = @ary.raku()\nOutput: &max-sum-of-mins-for-dyads( @ary)";

