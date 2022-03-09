#!/usr/bin/env raku

my @padovan-prime-no-dupes = lazy gather
    for 2, 3, 4, 5, 7, -> $a,$b,$c {$a + $b } … ∞
        { .take if .is-prime } 

say @padovan-prime-no-dupes[0..9].join: ', ', :skip-empty;

