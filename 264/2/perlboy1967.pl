#!/usr/bin/env perl
use v5.32;

use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use List::AllUtils qw(pairwise);

sub targetArray($arSrc,$arIdx) {
  my @l;
  pairwise {
    splice(@l,$b,1,grep { defined } $a,$l[$b]);
  } @$arSrc,@$arIdx;
  @l;
}

is([targetArray([0,1,2,3,4],[0,1,2,2,1])],
   [0,4,1,3,2],'Example 1');
is([targetArray([1,2,3,4,0],[0,1,2,3,0])],
   [0,1,2,3,4],'Example 2');
is([targetArray([1],[0])],
   [1],'Example 3');

done_testing;
