#!/usr/bin/env raku

use Test;

is 5, make-total-zero 5, 4;
is 3, make-total-zero 4, 6;
is 4, make-total-zero 2, 5;
is 3, make-total-zero 3, 1;
is 5, make-total-zero 7, 4;
is 6, make-total-zero 5, 13;
is 4, make-total-zero 3, 5;
is 13, make-total-zero 100, 19;
is 5, make-total-zero 100, 20;
is 535, make-total-zero 10000, 19;

done-testing;

subset Positive of UInt where *;

sub make-total-zero(Positive $x, Positive $y) {
  + ($x, $y, (* - *).abs ... 0).rotor(2=>-1).grep: {[>] $_}
}

