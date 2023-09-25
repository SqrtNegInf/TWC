#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

sub duplicateZeros (@) {
  my @r;

  for (@_) {
    push(@r,$_);
    if ($r[-1] == 0) {
      push(@r,0); pop(@_)
    }
  }

  return @r;
}

cmp_deeply([duplicateZeros(1, 0, 2, 3, 0, 4, 5, 0)],
           [1, 0, 0, 2, 3, 0, 0, 4]);
cmp_deeply([duplicateZeros(1, 2 , 3)],
           [1, 2, 3]);
cmp_deeply([duplicateZeros(0, 3, 0, 4, 5)],
           [0, 0, 3, 0, 0]);

done_testing;

