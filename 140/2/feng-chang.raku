#!/usr/bin/env raku

sub MAIN(UInt:D \i = 1000, UInt:D \j = 999, UInt:D \k = 314159) {
    put ((1..i)X(1..j)).map({.[0]*.[1]}).sort[k-1];
}
