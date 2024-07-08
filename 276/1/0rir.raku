#!/usr/bin/env raku

use Test;

my @Test =
   # exp        in
    Int,        (),
    0,          (1,),
    2,          (12, 12, 24, 24,         30),
    3,          (72, 48, 24,             5),
    0,          (                        72, 5, 3),
    0,          (                        12, 24, 18),
    6,          (12, 12, 12, 12,         24, 7,4,1),
    9,          (2, 2, 2, 2, 0, 24, 24,  7,4,1),
;
plan @Test ÷ 2;

multi task( @a where * !~~ Empty --> Int) {
        @a.classify( * % 24 ).values.map( { $_.elems × $_.end div 2}).sum;
}
multi task( @a --> Int) { Int }

for @Test -> $exp, @in {
    is task(@in), $exp, ($exp // "Int") ~ " <- @in.raku()";
}

done-testing;

my @hour = (12, 12, 12, 12, 36, 60, 0, 24, 24, 48, 7, 4, 1);
say "\nInput: \@hour = @hour[]\nOutput: &task(@hour)";

