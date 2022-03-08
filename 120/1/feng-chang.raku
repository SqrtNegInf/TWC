#!/usr/bin/env raku

sub MAIN(UInt:D $N where * ≤ 255 = 101) {
    put (($N +& 85) +< 1) +| (($N +& 170) +> 1);
}
