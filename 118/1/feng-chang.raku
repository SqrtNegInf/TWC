#!/usr/bin/env raku

sub MAIN(UInt:D $n = 99) {
    my Str $s = $n.base(2);
    put +($s.flip eq $s);
}
