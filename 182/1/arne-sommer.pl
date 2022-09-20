#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my @n = (5, 2, 9, 1, 7, 6, 9);

my $max   = $n[0];
my $index = 0;

for my $i (1 .. $#n)
{
  if ($n[$i] > $max)
  {
    $max   = $n[$i];
    $index = $i;
  }
}

say $index;
