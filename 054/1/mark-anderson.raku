#!/usr/bin/env raku

sub MAIN(UInt $n where * > 0 = 3, UInt $k where * > 0 = 4) {
    say (1..$n).permutations[$k-1];
}
