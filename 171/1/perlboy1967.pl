#!/usr/bin/env perl

use v5.16;
use warnings;

use List::Util qw(sum0);
use Math::Factor::XS qw(factors);

# Prototype(s)
sub isOddAbudant ($);


my ($i,$n) = (1,1);
while ($i <= 20) {
  if (isOddAbudant($n)) {
    say "$i\t$n"; $i++;
  }
  $n += 2;
}


sub isOddAbudant ($) {
  return $_[0] % 2 && sum0(factors($_[0])) > $_[0];
}
