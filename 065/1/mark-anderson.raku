#!/usr/bin/env raku

sub MAIN(UInt $N = 2, UInt $S = 10) {
    say (10**($N-1)..(10**$N)-1).map(*.comb.cache)
                                .grep(*.sum == $S)
                                .map(*.join)
                                .rotor(10, :partial)
                                .fmt("%d", "\n");
}
