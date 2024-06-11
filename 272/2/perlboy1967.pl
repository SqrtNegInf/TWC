#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);

use common::sense;

use Test2::V0 -no_srand;

use List::Util qw(sum0);
use List::MoreUtils qw(slide);

sub stringScore ($str) {
  sum0 slide { abs(ord($a) - ord($b)) } split //, $str;
}

is(stringScore('hello'),13,'Example 1');
is(stringScore('perl'),30,'Example 2');
is(stringScore('raku'),37,'Example 3');

done_testing;

