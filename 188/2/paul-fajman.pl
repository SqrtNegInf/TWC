#!/usr/bin/env perl

use strict;
use warnings;

my @x = (5,4,2,3,7);
my @y = (4,6,5,1,4);
my ($count, $i);

for ($i = 0; $i<$#x+1; $i++) {
  print "Input: \$x = $x[$i], \$y = $y[$i]\n";
  while ($x[$i] > 0 && $y[$i] > 0) {
    if ($x[$i] >= $y[$i]) {
      $x[$i] = $x[$i] - $y[$i];
    }
    elsif ($y[$i] >= $x[$i]) {
      $y[$i] = $y[$i] - $x[$i]
    }
    $count++;
  }
  print "Output: $count\n\n";
  undef($count);
}
