#!/usr/bin/env raku

sub MAIN(
    Int $k = 2, #= divisor
    @list = (4, 5, 1, 6) #= list of integers
) {
    (0 ..^ @list.elems)
        .combinations(2)
        .grep({ @$_.sum %% $k})
        .elems
        .say;
}
