#!/usr/bin/env perl
use v5.36;

use Math::Primality qw(is_prime);

my ($n, $i) = (0, 0);
my %padovanPrimes;

while ($i < 10) {
  my $p = PadovanN($n++);
  if (is_prime $p  and !exists $padovanPrimes{$p}) {
    $padovanPrimes{$p}++;
    say $p; $i++;
  }
}

sub PadovanN {
  my ($n) = @_;
  state $p = [1,1,1];

  $p->[$n-3] //= PadovanN($n-3);
  $p->[$n-2] //= PadovanN($n-2);
  $p->[$n] = $p->[$n-2] + $p->[$n-3] if ($n > 2);

  return $p->[$n];
}
