#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -no_srand;

use List::AllUtils qw(all pairs pairwise);

sub numberGame(@ints) {
  my @before = @ints;
  my @after;
  while (1) {
    push(@after,sort{$b<=>$a}@$_) for (pairs(sort{$a<=>$b}@before));
    last if (all{$_ == 0} pairwise {$a-$b} @before,@after);
    @before = @after; @after = ();
  }
  return @after;
}

is([numberGame(2,5,3,4)],[3,2,5,4],'Example 1');
is([numberGame(9,4,1,3,6,4,6,1)],[1,1,4,3,6,4,9,6],'Example 2');
is([numberGame(1,2,2,3)],[2,1,3,2],'Example 3');

done_testing;
