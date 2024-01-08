#!/usr/bin/env raku

use Test;

my @Test =
    10, (0, 1, 2), 0,
    10, (4, 3, 2, 1), 2,
    10, (1, 2, 3, 4, 5, 6, 7, 8, 9, 0), -1,
    2,  ( 5, 1, 3), 1,
    7,  ( 0, 7, 7, 7), 0,
    7,  ( 7, 7, 7, 7, 7, 5), 5,
    100, ( 4, 4, 4, 4, 4, 4), 4,
    -1, ( -1,-1,-1,), -1,
    -10,(), -1,
;
plan @Test ÷ 3;

multi func( Int $int where $int < 0, $list ) { -1 }; 
multi func( Int $int, $list -->Int:D) {
    my $min = $list.pairs.grep( { .key % $int == .value}).min;
    $min ~~ Pair    ?? $min.value   !! -1;
}

for @Test -> $int, $list, $exp {
    is func($int, $list), $exp,
            sprintf "%3i <- %3i R%% %s", $exp, $int, $list.raku;
}

done-testing;
my @int = 4,3,2,1;

say "\nInput: @int = (@int[])\nOutput: &func(10,@int)";
