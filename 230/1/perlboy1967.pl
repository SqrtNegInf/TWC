#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;
use Test::Deep;

sub seperateDigits (@) {
  return map { split //,$_ } @_;
}

cmp_deeply([seperateDigits(1,34,5,6)],[1,3,4,5,6]);
cmp_deeply([seperateDigits(1,24,51,60)],[1,2,4,5,1,6,0]);

done_testing;
