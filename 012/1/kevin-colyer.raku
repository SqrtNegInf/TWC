#!/usr/bin/env raku

my @primes = lazy (2,3,*+2 ... ∞).grep: *.is-prime;

for ^∞ -> $n {
    my $i = ( [*] @primes[0..$n] ) + 1;
    if ! $i.is-prime {
        say "12.1) (first $n primes + 1) -> $i is not prime";
        last;
    }
};

