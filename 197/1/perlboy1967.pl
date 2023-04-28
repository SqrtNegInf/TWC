#!/usr/bin/env perl

use v5.36;
use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);


sub zerosLast {
  my @r = grep { $_ != 0 } @_;
  return @r, (0) x (@_ - @r);
}


for (
  [[1,0,3,0,0,5],[1,3,5,0,0,0]],
  [[1,6,4],[1,6,4]],
  [[0,1,0,2,0],[1,2,0,0,0]],
  [[1,0,2,0,3],[1,2,3,0,0]],
  [[0,3,0,1,2],[3,1,2,0,0]],
) {
  cmp_deeply([zerosLast(@{$$_[0]})],$$_[1]);
}

done_testing;
