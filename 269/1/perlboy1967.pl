#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -srand => 1;

sub bitwiseOr (@ints) {
  my $c = 0;
  for (@ints) {
    $c++ if ($_ & 1) == 0;
    return 1 if $c > 1;
  }
  return 0;
}

is(bitwiseOr(1,2,3,4,5),1,'Example 1.1');
is(bitwiseOr(2,3,8,16),1,'Example 1.2');
is(bitwiseOr(1,2,5,7,9),0,'Example 1.3');

done_testing;
