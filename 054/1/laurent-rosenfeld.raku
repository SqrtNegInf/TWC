#!/usr/bin/env raku

sub MAIN (Int $n where * > 0 = 3, Int $k where * > 0 = 4) {
    (1..$n).permutations[$k - 1].say;
}
