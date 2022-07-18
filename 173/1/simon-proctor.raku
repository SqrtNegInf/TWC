#!/usr/bin/env raku

#| Given a value $n return if it is an Esthetic Number                        
sub MAIN( UInt $n = 5456) {
    say [==] 1, |( $n.comb().rotor( 2 => -1 ).map( { abs([-] @^a) } ) );
}
