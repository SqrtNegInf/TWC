#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test2::V0 -srand => 1;

use Algorithm::Combinatorics qw(variations_with_repetition);
use POSIX qw(floor);
use List::Util qw(sum0);

sub floorSum (@) {
  sum0 map { floor($$_[0] / $$_[1]) } variations_with_repetition([@_],2);
}

is(floorSum(2,5,9),10);
is(floorSum((7) x 7),49);

done_testing;
