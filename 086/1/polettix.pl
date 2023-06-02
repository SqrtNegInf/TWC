#!/usr/bin/env perl
use v5.36;

sub pair_difference ($A, @N) {
   $A = -$A if $A < 0;
   for my $i (0 .. $#N - 1) {
      for my $j ($i + 1 .. $#N) {
         return 1 if abs($N[$i] - $N[$j]) == $A;
      }
   }
   return 0;
}

sub main ($A = 7, @N) { say pair_difference($A, @N) }

main((10, 8, 12, 15, 5));
