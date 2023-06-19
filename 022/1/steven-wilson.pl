#!/usr/bin/env perl
use v5.36;

use Math::Primality qw/ next_prime /;

my @primes;
my @sexy_prime_pairs;
my $next_prime = 2;

while ( scalar @sexy_prime_pairs < 10 ) {
    push @primes, $next_prime;
    if ( grep { $_ == ( $next_prime - 6 ) } @primes ) {
        push @sexy_prime_pairs, [ ( $next_prime - 6 ), $next_prime ];
    }
    $next_prime = next_prime($next_prime);
}

say "First 10 Sexy Prime Pairs are:";
for (@sexy_prime_pairs) {
    say @{$_}[0], " ", @{$_}[1];
}
