#!/usr/bin/env perl
# The Weekly Challenge 168
# Task 1 Perrin Prime 
use v5.24.0;
use warnings;
use List::Util qw/none/;
use Math::Prime::Util qw/is_prime/;

my @perrin_primes = (2,3);
my ($ppnm3,$ppnm2,$ppnm1, $ppn) = (3,0,2,3);

while (scalar @perrin_primes < 13) {
    if (is_prime($ppn) == 2) {
        push @perrin_primes, $ppn if none {$_ == $ppn} @perrin_primes;
        say $ppn;
    }
    $ppnm3 = $ppnm2;
    $ppnm2 = $ppnm1;
    $ppnm1 = $ppn;
    $ppn = $ppnm2 + $ppnm3;
}

say join ", ", @perrin_primes;
