#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use List::AllUtils qw(sum);

sub elementDigitSum (@ints) {
  sum(@ints) - sum(split //,join '',@ints);
}

is(elementDigitSum(1,2,3,45),36);
is(elementDigitSum(1,12,3),9);
is(elementDigitSum(1,2,3,4),0);
is(elementDigitSum(236,416,336,350),1296);

done_testing;
