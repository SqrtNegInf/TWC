#!/usr/bin/env raku

use Test;

my @Test =
    (2, 1, 10),             211,
    (1, 2, 10),             112,
    (10, 7, 31, 5, 2, 2),   489,
    (6, 12, 25, 1),        1286,
;
plan @Test ÷ 2;

sub cat-head-tail( @a is copy --> Int) {
    my $sum;
    while @a > 1 { $sum += @a.pop R~ @a.shift; } 
    if @a == 1 { $sum += @a.pop }
    $sum
}

for @Test -> $in, $exp {
    is cat-head-tail($in), $exp, "$exp <- $in[]";
}

done-testing;

my @int = 1, 7,4,3;

say "\nInput: @int = @int.raku()\nOutput: &cat-head-tail( @int)";
