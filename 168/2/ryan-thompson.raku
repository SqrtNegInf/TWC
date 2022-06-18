#!/usr/bin/env raku

use Prime::Factor;

sub MAIN(Int $n = 10) {
    home_prime($n).say;
}

sub home_prime($n) {
    my @fac = prime-factors($n);

    @fac.elems == 1 ?? $n !! home_prime(@fac.join);
}
