#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -no_srand;

use List::AllUtils qw(sum0);

sub maximumFrequency (@ints) {
  my ($m,%f) = (0);
  map {$f{$_}++; $m++ if $f{$_} > $m} @ints;
  $m * scalar grep { $_ == $m } values %f;
}

is(maximumFrequency(1,2,2,4,1,5),4);
is(maximumFrequency(1,2,3,4,5),5);
is(maximumFrequency(1,1,3,3,5,5,7),6);

done_testing;
