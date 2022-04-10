#!/usr/bin/env perl

use strict;
use warnings;

use integer;

my @n = (23);
for my $n (@n) {
  my @k=($n);
  while ($n != 1) {
    if ($n % 2 == 0) {
      $n/=2;
    } else {
      $n*=3;
      $n++;
    }
    push @k,$n;
  }
  print join(', ',@k),"\n";
}
