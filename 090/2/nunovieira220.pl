#!/usr/bin/env perl
use v5.36;

use POSIX;

# Input
my $A = 14;
my $B = 12;

# Ethiopian Multiplication
my $res = 0;

while($A > 1) {
  $A = floor($A / 2);
  $B = $B * 2;
  $res += $B;
}

# Output
say $res;
