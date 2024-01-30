#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

use List::Util qw(sum0);

sub weakestRow ($ar) {
  my $i = 0;
  my @s = map { [$i++,sum0 @$_] } @$ar;
  map { $$_[0] } sort { $$a[1] <=> $$b[1] or $$a[0] <=> $$b[0] } @s;
}

is([weakestRow([
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 0],
  [1, 0, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [1, 1, 1, 1, 1]])],[2,0,3,1,4]);
is([weakestRow([
  [1, 0, 0, 0],
  [1, 1, 1, 1],
  [1, 0, 0, 0],
  [1, 0, 0, 0]])], [0,2,3,1]);

done_testing;
