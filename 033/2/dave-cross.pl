#!/usr/bin/env perl
use v5.36;

say '  x|', map { sprintf '%4s', $_ } 1 .. 11;
say '---+', '-' x 44;

for my $x (1 .. 11) {
  printf '%3s|', $x;
  for my $y (1 .. 11) {
    printf '%4s', ($x > $y ? '' : $x * $y);
  }
  print "\n";
}
