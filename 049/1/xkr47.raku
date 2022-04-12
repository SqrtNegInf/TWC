#!/usr/bin/env raku

sub MAIN(Int $multiplier = 55) {
    (1 .. ∞)
            .map(* * $multiplier)
            .grep(/^<[01]>+$/)
            .head(1)
            .say()
}
