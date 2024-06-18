#!/usr/bin/env perl
use v5.32;
use feature qw(signatures);
use common::sense;

#use Data::Printer;

use Test2::V0 -no_srand;

sub bAfterA ($str) {
  0 + ($str =~ m#^[^b]*b[^a]*$#);
}

is(bAfterA('aabb'),1,'Example 1 (aabb)');
is(bAfterA('abab'),0,'Example 2 (abab)');
is(bAfterA('aaa'),0,'Example 3 (aaa)');
is(bAfterA('bbb'),1,'Example 3 (bbb)');

done_testing;
