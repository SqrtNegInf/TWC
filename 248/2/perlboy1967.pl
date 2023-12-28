#!/usr/bin/env perl
use v5.36;

#use common::sense;

use Test2::V0 -srand => 1;

sub submatrixSum($arRef) {
  map {
    my $r = $_;
    [map { 
      $arRef->[$r][$_] +
      $arRef->[$r+1][$_] +
      $arRef->[$r][$_+1] +
      $arRef->[$r+1][$_+1]
    } 0 .. scalar(@{$arRef->[$r]}) - 2];
  } 0 .. scalar(@$arRef) - 2;
}

is([submatrixSum([
  [ 1, 2, 3, 4],
  [ 5, 6, 7, 8],
  [ 9,10,11,12],
])],[
  [14,18,22],
  [30,34,38],
]);

is([submatrixSum([
  [1,0,0,0],
  [0,1,0,0],
  [0,0,1,0],
  [0,0,0,1],
])],[
  [2,1,0],
  [1,2,1],
  [0,1,2],
]);

done_testing;
