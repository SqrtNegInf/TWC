#!/usr/bin/env perl
use v5.36;

#use common::sense;

use Test::More;

use List::Util qw(min max);
use List::MoreUtils qw(duplicates);

sub luckyNumber ($ar) {
  my @min = map { min @{$$ar[$_]} } 0 .. $#$ar;
  my @max = map { my $c = $_; 
                  max map { $$ar[$_][$c] } 0 .. $#$ar 
                } 0 .. $#{$ar->[0]};
  (duplicates @min,@max)[0];
}

is(luckyNumber([ [ 3,  7,  8],
                 [ 9, 11, 13],
                 [15, 16, 17] ]),15);
is(luckyNumber([ [ 1, 10,  4,  2],
                 [ 9,  3,  8,  7],
                 [15, 16, 17, 12] ]),12);
is(luckyNumber([ [7 ,8],
                 [1 ,2] ]), 7);

done_testing;
