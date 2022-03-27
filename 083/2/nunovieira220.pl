#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);

# Input
my @A = (2,13,10,8); # output is sum, not # flips

# Flip Array
my @sums = (0);

for my $val (@A) {
  my @arr = ();

  push @arr, ($_ + $val, $_ - $val) for (@sums);

  @sums = @arr;
}

my @res = grep { $_ >= 0 } sort { $a <=> $b } @sums;

# Output
say $res[0];
