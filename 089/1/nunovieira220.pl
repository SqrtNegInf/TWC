#!/usr/bin/env perl
use v5.36;

# Input
my $N = 100;

# GCD Sum
my $res = 0;

for(my $i = 1; $i <= $N; $i++) {
  for(my $j = $i + 1; $j <= $N; $j++) {
    $res += gcd($i, $j);
  }
}

# Output
say($res);

# GCD
sub gcd {
  my ($a, $b) = @_;
  return $b == 0 ? $a : gcd($b, $a % $b);
}
