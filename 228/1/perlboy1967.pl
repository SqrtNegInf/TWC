#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;

use List::Util qw(sum0);
use List::MoreUtils qw(frequency);

sub uniqueSum (@) {
  my %f = frequency @_;
  return sum0 grep { $f{$_} == 1 } keys %f;
}

is(uniqueSum(2,1,3,2),4);
is(uniqueSum(1,1,1,1),0);
is(uniqueSum(2,1,3,4),10);

done_testing;
