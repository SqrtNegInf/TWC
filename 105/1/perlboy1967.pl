#!/usr/bin/env perl
use v5.36;

use v5.16;

@ARGV = (5, 248832)
  unless scalar(@ARGV) == 2 or grep !/^\d+$/, @ARGV;

my ($n, $k) = @ARGV;

printf "Input: \$n = %d, \$k = %d\n", $n, $k;
printf "Output: %s\n", $k**(1/$n);
