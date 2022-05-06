#!/usr/bin/env raku

sub MAIN(UInt:D $max = 50) {
    for 0..$max -> $i {
        say $i if $i %% [+] $i.comb;
    }
}


