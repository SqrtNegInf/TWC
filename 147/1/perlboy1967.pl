#!/usr/bin/env perl
use v5.36;

use Math::Primality qw(next_prime);

my @tPrimes;
my %primes;

my $n = 1;
do {
  $n = next_prime($n);
  $primes{$n}++;

  if (index($n,0)<0) {
    my $p = $n;
    1 while ($p =~ s#^.## && exists $primes{$p});
    push(@tPrimes,$n) if ($p eq '');
  }
} while (scalar @tPrimes < 20);

printf "%s\n", join(',',@tPrimes);
