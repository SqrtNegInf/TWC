#!/usr/bin/env raku

use Test;

my @Test =
    (1,2,2,1,1,3),              True,
    (1,2,3),                    False,
    (-2,0,1,-2,1,1,0,1,-2,9),   True,
    (0…10000).List,             False,
    (1…100_000, 999_999).List,  False,
    (1 xx 70, 2 xx 71, 3 xx 72, 4 xx 75, 5 xx 76).flat, True;
;

plan @Test ÷ 2;

sub func( $l -->Bool) {
    my $k = $l.Bag.values.sort.List;
    $k eqv $k.unique.List;
}

for @Test -> $in, $exp {
    is func($in), $exp, ($++).Str;
}

done-testing;
my @int = (1 xx 70, 2 xx 71, 3 xx 72, 4 xx 75, 5 xx 76).flat;

say "\nInput: @int = @int[]\nOutput: ", func(@int).Int;
