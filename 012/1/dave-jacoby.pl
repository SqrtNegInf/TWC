#!/usr/bin/env perl
use v5.36;

use List::Util qw{reduce};

my @primes;

while (1) {
    state $n = 0;
    $n++;
    if ( is_prime($n) ) {
        push @primes, $n;
        my $eu = 1 + reduce { $a * $b } @primes;
        if ( !is_prime($eu) ) {
            say join "\t", $n, $eu;
            say join ',', @primes;
            say join ',', factor($eu);
            last;
        }
    }
    last if $n > 100;
}

sub is_prime ( $n ) {
    my @factors = factor($n);
    return scalar @factors == 1 ? 1 : 0;
}

sub factor ( $n ) {
    my @factors;
    for my $i ( 1 .. $n - 1 ) {
        push @factors, $i if $n % $i == 0;
    }
    return @factors;
}
