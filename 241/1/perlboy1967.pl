#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test2::V0 -srand => 1;

sub nArithmeticTriplets (\@$) {
  my ($arL,$diff) = @_;
  my $n = 0;

  for my $i (0 .. $arL->$#* - 2) {
    for my $j ($i + 1 .. $arL->$#* - 1) {
      for my $k ($j + 1 .. $arL->$#*) {
        $n++ if ($$arL[$j] - $$arL[$i] == $diff == $$arL[$k] - $$arL[$j]);
      }
    }
  }

  return $n;
}

is(nArithmeticTriplets(@{[0,1,4,6,7,10]},3), 2);
is(nArithmeticTriplets(@{[4,5,6,7,8,9]},2), 2);

done_testing;
