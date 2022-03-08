#!/usr/bin/env raku

sub MAIN(UInt:D $n where * < 256  = 101) {
    say $n +> 4 +| $n +< 4 +& 0xf0;
}
