#!/usr/bin/env raku

unit sub MAIN(Int $n = 5456);
my sub esthetic-number(Int $n --> Bool) { $n.comb.rotor(2 => -1).map({1 == abs [-] $_}).all.Bool }
say esthetic-number $n
