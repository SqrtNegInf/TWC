#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -srand => 1;

sub distributeElements (@ints) {
  my @a = shift @ints; my @b = shift @ints;
  for (@ints) {
    $a[-1] < $b[-1] ? push(@b,$_) : push(@a,$_);
  }
  return (@a,@b);
}

is([distributeElements(2,1,3,4,5)],
                      [2,3,4,5,1],'Example 2.1');
is([distributeElements(3,2,4)],
                      [3,4,2],'Example 2.2');
is([distributeElements(5,4,3,8)],
                      [5,3,4,8],'Example 2.3');
is([distributeElements(3,2,2,1)],
                      [3,2,1,2],'Own test');
done_testing;
