#!/usr/bin/env perl

use v5.16;

my $n = shift // 7;

foreach my $base (2 .. $n - 2) {
  foreach my $digit (1 .. $base - 1) {
    my ($sum,$pos) = (0,0);
    while ($sum < $n) {
      $sum += $digit * $base**$pos++;
    }
    if ($sum == $n) {
      say "n=$n is a Brazilian Number :: base$base(",join('|',($digit) x $pos),')';
      exit;
    }
  }
}

say "n=$n is NOT a Brazilian Number";
