#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/is_prime factor/;

for my $i (1..50){
  my @factors = factor($i);
  my $factor_count = scalar(@factors);
  if (is_prime($factor_count)){
    print "$i (@factors)\n";
  }
}
