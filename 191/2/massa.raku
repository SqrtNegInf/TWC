#!/usr/bin/env raku

use Test;

is 2, cute-list 2;
is 3, cute-list 3;
is 8, cute-list 4;

done-testing;

subset Valid of Int where 0 < * ≤ 15;

sub cute-list(Valid \n) {
  + (1 .. n).permutations.grep: -> @list {
    @list.pairs.map({ (.key + 1) %% .value || .value %% (.key + 1) }).all.so
  }
}
