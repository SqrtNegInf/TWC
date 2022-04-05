#!/usr/bin/env raku

sub MAIN(UInt $m = 5, UInt $n where $m >= $n > 0 = 3) {
    say (1..$m).combinations: $n; 
}
