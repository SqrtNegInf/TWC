#!/usr/bin/env perl

use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

sub nReversePairs (@) {
  my $n = 0;

  for my $i (0 .. $#_ - 1) {
    for my $j ($i + 1 .. $#_) {
      $n++ if ($_[$i] > 2 * $_[$j]);
    }
  }

  return $n;
}

is(nReversePairs(1,3,2,3,1),2);
is(nReversePairs(2,4,3,5,1),3);

done_testing;
