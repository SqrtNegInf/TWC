#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

use List::AllUtils qw(sum);

sub multiplyByTwo ($i,@ints) {
  my %i = map { ($_,1) } @ints; 
  $i *= 2 while (exists $i{$i});
  return $i;
}

is(multiplyByTwo(3,5,3,6,1,12),24);
is(multiplyByTwo(1,1,2,4,3),8);
is(multiplyByTwo(2,5,6,7),2);

done_testing;
