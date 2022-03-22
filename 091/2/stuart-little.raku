#!/usr/bin/env raku

sub jumpp(@a where *.all >= 0) {
    @a[0] >= @a.elems-1 && return True;
    @a[0] == 0 && return False;
    return jumpp(@a[@a[0]..*]);
}

say <1 2 1 2>.&jumpp.Int
