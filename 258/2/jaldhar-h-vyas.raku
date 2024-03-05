#!/usr/bin/env raku

sub MAIN(
    $k = 1,
    @ints = (2, 5, 9, 11, 3)
) {
    @ints
    .keys
    .map({ $_.base(2) })
    .grep({
        $_
        .comb
        .grep({ $_ == 1 })
        .elems == $k
    })
    .map({ @ints["0b$_"] })
    .sum
    .say;
}
