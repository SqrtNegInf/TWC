#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(factor is_prime);

foreach my $c (1..50) {
  if (is_prime(scalar factor($c))) {
    print "$c\n";
  }
}

