#!/usr/bin/env perl
use v5.36;

use Math::Primality qw(next_prime);

my $N = shift // 10_001;

my ($i,$p) = (1,2);

$p = next_prime($p) while ($i++ < $N);

printf "%d'th prime = %d\n", $N, $p;
