#!/usr/bin/env perl
use v5.36.0;

say shortest_time(("10:10", "09:30", "09:00", "09:55"));

sub shortest_time {
   my @times = map { my ($h, $m) = split m{:}mxs; $h * 60 + $m } @_
      or return;
   my $period = 24 * 60;
   my $min = $period;
   for my $i (0 .. $#times - 1) {
      for my $j ($i + 1 .. $#times) {
         my $delta = ($times[$i] - $times[$j]) % $period;
         $min = ($_ < $min ? $_ : $min) for ($delta, $period - $delta);
      }
   }
   return $min;
}
