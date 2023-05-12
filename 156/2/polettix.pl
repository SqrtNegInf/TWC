#!/usr/bin/env perl
use v5.36;

use Algorithm::Knapsack;
use ntheory 'divisors';
use List::Util 'sum';

say $_, ' ', is_weird($_) for (@ARGV ? @ARGV : (12, 70));

sub is_weird ($n) {
   my @divs = reverse divisors($n);
   shift @divs if @divs > 1;
   return 0 if $n >= sum @divs;
   my $ks = Algorithm::Knapsack->new(capacity => $n, weights => \@divs);
   $ks->compute;
   for my $solution ($ks->solutions) {
      my $sum = sum @divs[$solution->@*];
      return 0 if $sum == $n;
   }
   return 1;
}
