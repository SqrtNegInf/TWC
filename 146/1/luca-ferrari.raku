#!/usr/bin/env raku

sub MAIN( Int $which where { $which > 0 } = 10001 ) {
    my @primes = lazy { ( 1 .. Inf ).grep( *.is-prime ); }
    @primes[ $which ].say;
}
