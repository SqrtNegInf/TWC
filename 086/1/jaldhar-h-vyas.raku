#!/usr/bin/env raku

sub MAIN (
    $A = 7,
    @N  = (10, 8, 12, 15, 5)
) {
    say @N.combinations(2).grep({ @_.max - @_.min == $A }).elems ?? 1 !! 0;
}
