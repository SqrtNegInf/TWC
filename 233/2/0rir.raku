#!/usr/bin/env raku

use Test;

my @Test =
(1,1,2,2,2,3),  (3,1,1,2,2,2),
(2,3,1,3,2),    (1,3,3,2,2),
(-1,1,-6,4,5,-6,1,4,1), (5,-1,4,4,-6,-6,1,1,1),
;
plan @Test ÷ 2;

sub freq( @a) {
    do
    for @a.Bag.pairs.sort(
            {$^a.value <=> $^b.value or $^b.key <=> $^a.key})
    {
        .key xx .value
    }.flat;
}

for @Test -> @in, @exp {
    is freq(@in), @exp, "@exp[] <- @in[]";
}
done-testing;

my @int = 5,5,5,5,5, 1, -2,-2, -4,-4,-4,-4, 4,4,4,4, -5,-5,-5,-5,-5, -1;
say "\n\nInput: @int = @int[]\nOuput: &freq(@int)";
