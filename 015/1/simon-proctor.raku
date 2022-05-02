#!/usr/bin/env raku

sub MAIN( 
    UInt $x = 10
) {
    my @primes = (1..*).grep( *.is-prime );

    my @strong = (1..*).grep( { @primes[$_] > (@primes[$_-1] + @primes[$_+1]) / 2 } ).map( { @primes[$_] } );
    my @weak = (1..*).grep( { @primes[$_] < ( @primes[$_-1] + @primes[$_+1] ) / 2 } ).map( { @primes[$_] } );

    say "Strong {@strong[^$x].join(", ")}";
    say "Weak {@weak[^$x].join(", ")}"; 
}
