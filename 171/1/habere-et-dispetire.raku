#!/usr/bin/env raku

# not odds...

use Prime::Factor;

sub is-abundant ( $n ) {
    proper-divisors( $n ).sum > $n
}

(1 .. ∞)
    .grep( &is-abundant ) # https://oeis.org/A005101
    .head(           232)
    .skip(           231)
    .put
