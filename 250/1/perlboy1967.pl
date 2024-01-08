#!/usr/bin/env perl

use v5.36;

#use common::sense;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(first_index);

sub smallestIndex (@ints) {
  first_index { $_ % 10 == $_[$_] } 0 .. $#_;
}

is(smallestIndex(0,1,2),0);
is(smallestIndex(4,3,2,1),2);
is(smallestIndex(1,2,3,4,5,6,7,8,9,0),-1);

done_testing;
