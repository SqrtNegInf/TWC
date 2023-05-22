#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub maxNumber (@) {
  join('',sort{$b.$a<=>$a.$b}@_);
}

is(maxNumber(1,23),231);
is(maxNumber(10,3,2),3210);
is(maxNumber(31,2,4,10),431210);
is(maxNumber(5,11,4,1,2),542111);
is(maxNumber(1,10),110);

done_testing;
