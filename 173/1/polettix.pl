#!/usr/bin/env perl
use v5.36;

say is_esthetic($_) ? "$_ is esthetic" : "$_ is NOT esthetic"
   for <5456 120 121 23456 2346 7654567 765467>;

sub is_esthetic ($candidate) {
   test_adjacents(
      sub ($x, $y) { use integer; abs($x - $y) == 1 },
      split m{}mxs, $candidate
   );
}

sub test_adjacents ($test, @input) {
   for my $i (1 .. $#input) {
      return 0 unless $test->(@input[$i - 1, $i]);
   }
   return 1;
}
