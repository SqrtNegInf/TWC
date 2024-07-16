#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

use Algorithm::Combinatorics qw(combinations);
use List::AllUtils qw(min uniq);

sub strongPair (@ints) {
  @ints = uniq(@ints);
  scalar grep { abs($$_[0]-$$_[1]) < min(@$_) } combinations(\@ints,2);
}

is(strongPair(1..5),4);
is(strongPair(5,7,1,7),1);

done_testing;
