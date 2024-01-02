#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

use common::sense;


use Test2::V0 -srand => 1;

use List::MoreUtils qw(frequency);

sub equalPairs (@ints) {
  my %f = frequency @ints;
  return [] if grep { $f{$_} % 2 } keys %f;
  [map { [$_,$_] } map { ($_) x ($f{$_}>>1) } sort {$a <=> $b} keys %f];
}

is(equalPairs(3,2,3,2,2,2),[[2,2],[2,2],[3,3]]);
is(equalPairs(1,2,3,4,),[]);

done_testing;
