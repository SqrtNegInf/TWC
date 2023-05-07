#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);
use Math::Factor::XS qw(factors);

my ($i,$n) = (1,1);
while ($i <= 20) {
  if (isOddAbudant($n)) {
    say "$i\t$n"; $i++;
  }
  $n += 2;
}

sub isOddAbudant {
  return $_[0] % 2 && sum0(factors($_[0])) > $_[0];
}
