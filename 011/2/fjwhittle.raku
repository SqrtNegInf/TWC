#!/usr/bin/env raku

sub identity-matrix (UInt $n) {
  (^$n).map: -> $i { (^$n).map: -> $j { Int($j == $i) } };
}

#| Script to create an identity matrix
unit sub MAIN (
  UInt $n = 5
);

.say for identity-matrix $n;
