#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

sub uniqSumZero ($n) {
  my @n = (0);
  if ($n > 1) {
    @n = map { (-$_,$_) } 1 .. $n >> 1;
    push(@n,0) if ($n % 2 != 0);
  }
  [sort { $a <=> $b } @n];
}

is(uniqSumZero(1),[0]);
is(uniqSumZero(2),[-1,1]);
is(uniqSumZero(3),[-1,0,1]);
is(uniqSumZero(4),[-2,-1,1,2]);
is(uniqSumZero(5),[-2,-1,0,1,2]);

done_testing;
