#!/usr/bin/env perl

use v5.16;
use warnings;

use Math::Prime::XS qw(is_prime);
use Math::Factor::XS qw(prime_factors);
use Try::Tiny;

# prototype(s)
sub homePrime ($);

for my $n (2 .. 12) {
  my  $h = homePrime($n);
  printf "%d\t=> %s\n", $n, (!defined $h ? 'Too big to handle' : $h);
}

sub homePrime ($) {
  my ($n) = @_;

  try { $n  = join '', prime_factors($n) while (!is_prime($n)) }
  catch { return };

  return $n;
}
