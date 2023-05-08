#!/usr/bin/env perl
use v5.36;
use common::sense;

use Test::More;

sub numberPlacement ($@) {
  my ($n,$s) = (shift @_,join '',@_);
  
  while ($n and $s =~ m#000#g) { $n--; pos($s)-- }

  $n == 0 ? 1 : 0;
}

is(numberPlacement(1,1,0,0,0,1),1);
is(numberPlacement(2,1,0,0,0,1),0);
is(numberPlacement(3,1,0,0,0,0,0,0,0,1),1);
is(numberPlacement(0),1);
is(numberPlacement(1),0);
is(numberPlacement(1,0),0);
is(numberPlacement(1,0,0),0);
is(numberPlacement(1,0,0,0),1);

done_testing;
