#!/usr/bin/env raku

sub MAIN(Int $n = 3, Int $k = 4) {
    [1 .. $n].permutations[$k - 1].join.say;
}
