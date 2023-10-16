#!/usr/bin/env perl

use v5.32;
use feature 'signatures';

use common::sense;


use Test::More;
use Test::Deep qw(cmp_deeply);


sub runningSum (@numbers) {
  my $s = 0;
  return map { $s += $_; } @numbers;
}

cmp_deeply([runningSum(1,2,3,4,5)],[1,3,6,10,15]);
cmp_deeply([runningSum(1,1,1,1,1)],[1,2,3,4,5]);
cmp_deeply([runningSum(0,-1,1,2)],[0,-1,0,2]);

done_testing;
