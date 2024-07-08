#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -no_srand;
use DDP;

use Algorithm::Combinatorics qw(combinations);

sub completeDay (@hours) {
  grep { $_ % 24 == 0 } map { $$_[0] + $$_[1] } combinations(\@hours,2);
}

is(completeDay(12,12,30,24,24),2);
is(completeDay(72,48,24,5),3);
is(completeDay(12,18,24),0);

done_testing;
