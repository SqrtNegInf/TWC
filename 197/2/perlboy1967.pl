#!/usr/bin/env perl

use v5.36;
use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(pairwise);


sub wiggleSort {
  my @lo = reverse sort { $a <=> $b } @_;
  my @up = splice(@lo, 0, scalar(@_) >> 1);
  return grep { defined } pairwise {$a,$b} @lo, @up;
}


for (
  [[1,5,1,1,6,4],[1,6,1,5,1,4]],
  [[1,3,2,2,3,1],[2,3,1,3,1,2]],
  [[1,2,3,4,5,6,7,8,9],[5,9,4,8,3,7,2,6,1]],
  [[8,12,10,11,9],[10,12,9,11,8]],
) {
  cmp_deeply([wiggleSort(@{$$_[0]})],$$_[1]);
}

done_testing;
