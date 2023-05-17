#!/usr/bin/env perl
use v5.36;

use Math::Prime::XS qw(primes);
use Algorithm::Combinatorics qw(combinations);

my $N = shift // 100;

printf "Semiprimes <= %d = %s\n", $N, join(',',getSemiPrimes($N));

sub getSemiPrimes {
  my ($n) = @_;

  my %semiPrimes;
  my @primes = primes($n/2);

  my $c = combinations(\@primes, 2);
  while (my $ar = $c->next) {
    my $product = $ar->[0] * $ar->[1];
    $semiPrimes{$product}++ if ($product <= $n);
  }

  return sort { $a <=> $b } keys %semiPrimes;
}

