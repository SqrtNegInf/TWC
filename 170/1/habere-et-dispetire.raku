#!/usr/bin/env raku

(1 .. ∞)
    .grep( 1 | &is-prime )
    .produce( &[×] )
    .head( 10 )
    .put
