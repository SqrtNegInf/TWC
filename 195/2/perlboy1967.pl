#!/usr/bin/env perl

use v5.36;
use common::sense;

use List::Util qw(min max);
use List::MoreUtils qw(frequency);

use Test::More;


sub mostFreqEven {
  my %f = frequency grep { $_ % 2 == 0} @_;
  my $max = max(0,values %f);
  return -1 if ($max == 0);
  return min(grep{$f{$_} == $max}keys %f);
}


for (
  [[1,1,2,6,2],2],
  [[1,3,5,7],-1],
  [[6,4,4,6,1],4]
) {
  is(mostFreqEven(@{$_->[0]}),$_->[1]);
}

done_testing;
