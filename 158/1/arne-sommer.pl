#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'is_prime';
use List::Util 'sum';

my $limit = $ARGV[0] || 100;

my @ap;

while (1)
{
  state $current = 0;

  last if $current++ >= $limit;
  next unless is_prime($current);

  my @digits = split(//, $current);
  my $sum    = sum(@digits);
  
  push(@ap, $current) if is_prime($sum);
}

say join(", ", @ap);
