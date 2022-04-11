#!/usr/bin/env raku

sub nob(@a) {
    @a.grep({ $_ == @a.grep( * > $_ ) })
}

say nob((19,11,9,7,20,3,17,16,2,14,1).map(*.Int));
