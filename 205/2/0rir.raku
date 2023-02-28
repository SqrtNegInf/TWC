#!/usr/bin/env raku

use Test;

my @Test =
    [( 1,),                  Int, ],
    [( 1,1,),                Int, ],
    [( 1,2,3,4,5,6,7),         7, ],
    [( 2,4,1,3),               7, ],
    [( 10,5,7,12,8),          15, ],
    [( -11,800),            -811, ],
    [( 1,11,111,1111,800),  1911, ],
    [( 13,13,9,1),            12, ],
    [( -100,1),              -99, ],
    [( -100,1,1),            -99, ],
;
plan +@Test;

multi highest-bitwise-xor-duo( @a where *.elems < 2 ) { Int }
multi highest-bitwise-xor-duo( @a --> Int) {
    return Int if @a.unique.elems < 2 ;
    max do ( $_[0] +^ $_[1]) for  @a.unique.combinations(2)
}
for @Test -> (@in, $exp) {
    is highest-bitwise-xor-duo( @in), $exp, "$exp.raku()\t<-- @in[]";
}
done-testing;

my @a = -100,1,1;
say "\nInput: @array = @a[]\n",
    "Output: &highest-bitwise-xor-duo( @a)";


