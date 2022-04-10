#!/usr/bin/env raku

unit sub MAIN(Int:D $n where * >= 1 = 3, Int:D $k where * >= 1 = 4) {
    say (1...$n).permutations.map(*.join).sort(* > *).[$k - 1]
}
