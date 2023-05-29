#!/usr/bin/env perl
use v5.36;

use Memoize;

memoize('fusc');

printf "%s\n", join(', ', map { fusc($_) } (0 .. 49));


sub fusc {
  my ($n) = @_;

  return $n if ($n < 2);

  if (($n % 2) == 0) {
    return fusc($n/2);
  } else {
    return fusc(($n-1)/2) + fusc(($n+1)/2);
  }
}
