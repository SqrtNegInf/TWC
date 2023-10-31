#!/usr/bin/env perl
use v5.36;

use common::sense;
use feature 'signatures';

use Test::More;

sub buildArray (@int) {
  [map { $int[$int[$_]] } (0 .. scalar(@int) - 1)];
}

is_deeply(buildArray(0,2,1,5,3,4),[0,1,2,4,5,3]);
is_deeply(buildArray(5,0,1,2,3,4),[4,5,0,1,2,3]);

done_testing;
