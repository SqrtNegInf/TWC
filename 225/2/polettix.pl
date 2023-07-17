#!/usr/bin/env perl
use v5.36;

{ local $" = ', '; say "(@{[ left_right_sum_diff(10, 4, 8, 3) ]})" }

sub left_right_sum_diff (@input) {
   my $sum = 0;
   my @retval;
   for my $i (0 .. $#input) {
      push @retval, $sum;
      $sum += $input[$i];
   }
   for my $i (0 .. $#input) {
      $sum -= $input[$i];
      my $diff = $retval[$i] - $sum;
      $retval[$i] = $diff > 0 ? $diff : -$diff;
   }
   return @retval;
}
