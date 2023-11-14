#!/usr/bin/env perl

use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

sub flipMatrix {
  [ map { [map { ++$_ % 2 } reverse @$_] } @_ ];
}

is(flipMatrix([1,1,0],[0,1,1],[0,0,1]),
             [[1,0,0],[0,0,1],[0,1,1]]);
is(flipMatrix([1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]),
             [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]);

done_testing;
