#!/usr/bin/env raku

use Test;

my @Test =
    #   in                  k   result
    (1, 5, 3, 2, 4, 2),     2, (1, 2),
    (1, 2, 4, 3, 5),        6, (),
    (5, 3, 2, 4, 2, 1),     4, (4),
;
plan @Test ÷ 3;

sub loca-of-value($a, $k) {
    $a.sort.grep( $k, :k).List;
}

for @Test -> $in, $k, $exp {
    is loca-of-value($in, $k), $exp, "$exp <- $k «- $in";
}

done-testing;

my @int = (5, 3, 2, 4, 2, 1);
constant \K = 4;
say "\nInput: @int = @int.raku(), K = $(K)\nOutput: ", loca-of-value( @int, K);
