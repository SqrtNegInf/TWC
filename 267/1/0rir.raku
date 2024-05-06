#!/usr/bin/env raku

use Test;

my @Test =
   Int, (),
   Int, ( 0,),
   Int, (-1,),
   Int, ( 1,),
    -1, ( 1, -1),
     1, ( 1,  1),
     0, ( 0,  0),
     0, ( 1,  0),
     0, (-1,  0),
     1, (-1, -2, -3, -4,  3,  2,  1),
     0, ( 1,  2,  0, -2, -1),
    -1, (-1, -1,  1, -1,  2),
     1, ( flat     -1 xx 10_000,    1 xx 9_999        ).List,
    -1, ( flat     -1 xx 9_999,     1 xx 9_999        ).List,
     0, ( flat 0,  -1 xx 100_000,   1 xx 99_999       ).List,
     0, ( flat     -1 xx 100_000,   1 xx 99_999,    0 ).List,
;

plan @Test ÷ 2;

sub mult-sign( List $a) {
    return Int if $a ~~ Empty or +@$a == 1;
    my ( $n, $z, $p) =       $a».sign.Bag{-1, 0, 1};      # Thanks Util
   #my ( $n, $z, $p) = hyper $a».sign.Bag{-1, 0, 1};      # Thanks Util
    return  0 if $z;
    return -1 unless $n %% 2;
    return  1;
}

for @Test -> $exp, $in {
    is mult-sign($in), $exp, "$exp.raku() <- $in.gist()";
}

done-testing;
my @int = flat -1 xx 11,1 xx 10;

say "\nInput: @int = @int[]\nOutput: &mult-sign(@int)";

exit;

