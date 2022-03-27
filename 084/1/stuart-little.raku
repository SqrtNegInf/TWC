#!/usr/bin/env raku

sub rev(Int $nr) {
    return ($nr >= 2**31) ?? (0)
    !! ($nr.sign.chop ~ $nr.abs.flip);
}

say rev(-1700.EVAL.Int);
