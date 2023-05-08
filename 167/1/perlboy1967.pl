#!/usr/bin/env perl
use v5.36;

use IO::File;
use Math::Primality qw(next_prime);
use Math::Prime::XS qw(is_prime);

STDOUT->autoflush(1);

my ($n, $p) = (0,0);

# According to http://oeis.org/A016114 
# should the first 19 circular primes be doable
while ($n < 19) {
  $p = next_prime($p);
  if (isCircularPrime($p)) {
    say int($p); $n++;
  }
}

sub isCircularPrime {
  my $p = $_[0];

  state $circularPrimes = {};

  # Below 10 are straight circular primes
  if ($p < 10) {
    $circularPrimes->{$p}++;
    return 1;
  }

  # If the prime contains a '5' or becomes potentionally even
  # it can't be a circular prime
  return 0 if ($p =~ m#[024568]#);

  my ($n, $len) = ($p, length($p) - 1);
  for (1 .. $len) {
    $n = substr($n,1).substr($n,0,1);
    return 0 unless (!exists $circularPrimes->{$n} && is_prime($n));
  }

  $circularPrimes->{$p}++;

  return 1;
}

 
