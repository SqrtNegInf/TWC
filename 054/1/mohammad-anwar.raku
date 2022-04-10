#!/usr/bin/env raku

sub MAIN(Int $n where * > 0 = 3, Int $k where * > 0 = 4) {
    die "ERROR: Invalid sequence number $k." unless $k <= [*] 1..$n;
    say ( 1..$n ).permutations.map({ .join })[$k -1];
}
