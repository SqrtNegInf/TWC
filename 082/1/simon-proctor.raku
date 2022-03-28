#!/usr/bin/env raku

#| Given two positive integers print the common factors (not including the values themselves).
sub MAIN ( UInt $M = 100, UInt $N = 500 ) {
    say "({(fac($M) (&) fac($N)).keys.sort.join(', ')})"
}

sub fac( UInt $v ) {
    (1..^$v).grep( $v %% * )
}
