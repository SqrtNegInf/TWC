#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

use List::AllUtils qw(uniq);

sub uniqueOccurences (@ints) {
  my %f; $f{$_}++ for (@ints);
  0 + (keys(%f) == uniq values(%f));
}

is(uniqueOccurences(1,2,2,1,1,3),1);
is(uniqueOccurences(1,2,3),0);
is(uniqueOccurences(-2,0,1,-2,1,1,0,1,-2,9),1);

done_testing;
