#!/usr/bin/env raku

use Test;

my @Test =
    3,  (4, 4, 2, 4, 3),
    0,  (1, 1, 1, 1, 1),
    28, (4, 7, 1, 10, 7, 4, 1, 1),
;

plan @Test/2;

sub func( @a = @Test[1]) {
    my @c = @a.combinations(3).grep( {
            $_[0] ≠  $_[1]
        and $_[1] ≠  $_[2]
        and $_[2] ≠  $_[0] }
    ).elems;
}

for @Test -> $exp, @in {
    is func(@in), $exp, "$exp <- @in.raku()";
}
