#!/usr/bin/env perl
use v5.36;

use Math::Prime::XS qw(is_prime);
use Math::Factor::XS qw(prime_factors);
use Try::Tiny;

for my $n (2 .. 12) {
  my  $h = homePrime($n);
  printf "%d\t=> %s\n", $n, (!defined $h ? 'Too big to handle' : $h);
}

sub homePrime {
  my ($n) = @_;

  try { $n  = join '', prime_factors($n) while (!is_prime($n)) }
  catch { return };

  return $n;
}
