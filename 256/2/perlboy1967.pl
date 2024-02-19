#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(pairwise);

sub mergeStrings ($s1,$s2) {
  my @s1 = split //, $s1; my @s2 = split //, $s2;
  join '', pairwise { ($a//'').($b//'') } @s1, @s2;
}

is(mergeStrings('abcd','1234'),'a1b2c3d4');
is(mergeStrings('abc','12345'),'a1b2c345');
is(mergeStrings('abcde','123'),'a1b2c3de');

done_testing;
