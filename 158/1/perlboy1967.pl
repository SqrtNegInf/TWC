#!/usr/bin/env perl
use v5.36;

use Math::Primality qw(next_prime is_prime);
use List::Util qw(sum);

my @ap;

my $p = next_prime(1);
while ($p <= 100) {
  push(@ap, $p) if is_prime(sum(split //,$p));
  $p = next_prime($p);
}

say join(', ',@ap);
