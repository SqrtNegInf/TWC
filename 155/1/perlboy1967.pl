#!/usr/bin/env perl

use v5.16;
use bigint;

use Math::Primality qw(next_prime);

my %fortunateNumbers;
my @primes;
my @product;

my $N = 8;

while ($N > 0) {
  push(@primes, next_prime($primes[-1] // 0));
  push(@product, $primes[-1] * ($product[-1] // 1));

  my $fN = next_prime($product[-1] + 1) - $product[-1];

  if (!exists $fortunateNumbers{$fN}) {
    $fortunateNumbers{$fN}++;
    $N--;
  }
}

say join ', ', sort { $a <=> $b } keys %fortunateNumbers;
