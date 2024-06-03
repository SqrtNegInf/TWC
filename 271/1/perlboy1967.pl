#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);

use common::sense;

use Test2::V0 -no_srand;

use List::AllUtils qw(max);

sub maximumOnes ($ar) {
  my ($i,%m) = (1);
  map {push(@{$m{grep{$_ == 1} @$_}}, $i++)} @$ar;
  shift(@{$m{max keys %m}});
}

is(maximumOnes([[0,1],[1,0]]),1,'Example 1');
is(maximumOnes([[0,0,0],[1,0,1]]),2,'Example 2');
is(maximumOnes([[0,0],[1,1],[0,0]]),2,'Example 3');

done_testing;
