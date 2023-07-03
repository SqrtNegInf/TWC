#!/usr/bin/env raku

sub MAIN (Int() $n where * > 0 = 500) { put count-primes($n) }
sub count-primes ($n) { (2 .. $n).grep({ .is-prime }).elems }
