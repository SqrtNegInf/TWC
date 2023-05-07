#!/usr/bin/env perl
use v5.36;

use Math::Factor::XS qw(prime_factors);

my ($n,$b,@f) = (0,1);

while ($n < 20) {
  if (isBrilliantNumber($b,@f)) {
    printf "%s => (%s)\n", $b, join(',',@f);
    $n++;
  }
  $b++;
}


sub isBrilliantNumber {
  my ($n,$arF) = @_;

  my @f = prime_factors($n);
  if (scalar @f == 2 && length($f[0]) == length($f[1])) {
    @$arF = @f;
    return 1;
  }

  return 0;
}
