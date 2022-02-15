#!/usr/bin/env raku

use Test;

plan 3;

is(mtable(2,3,4),3,'example 1');
is(mtable(3,3,6),4,'example 2');
is(mtable(1000,999,314159),93532,'example 3');

sub mtable($i,$j,$k) {
  my @l;
  for (1..$i) -> $a {
    push @l,map {$a*$_}, (1..$j);
  }
  @l=@l».List.flat.sort;
  return @l[$k-1];
}
