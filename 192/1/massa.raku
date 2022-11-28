#!/usr/bin/env raku

use Test;

is 2, binary-flip 5;
is 3, binary-flip 4;
is 1, binary-flip 6;
is 2⁶⁴ -2, binary-flip 2⁶⁴ +1;

done-testing;

sub binary-flip(UInt() $_) {
  +^$_ +^ (+^0 +< .base(2).chars)
}

