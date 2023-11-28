#!/usr/bin/env raku

use Test;

my @Test =
    # in                    exp
    (0,),                   0,
    (1,),                   1,
    (1,0),                  1,
    (-10, -1, 5),       -1411,
    (2, 0, 1, -10),     -1167,
    (2, 1, 4),            141,
    (2,2,2,2),            120,
;

plan @Test ÷ 2;

sub func( @a where *.end > -1) {
   [+] @a.combinations( 1..@a).map: { .min × .max² } ; # do-able w/ Whatever?
}

for @Test -> @in, $exp {
    is func(@in), $exp, "$exp <= @in[]";
}

done-testing;

my @num = 2, 0, 1, -10;
say "\nInput: @num = @num[]\nOutput: ", func( @num).raku;
