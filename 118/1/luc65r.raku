#!/usr/bin/env raku

sub MAIN(UInt:D $size = 99) {
    say +($_ eq .flip) given $size.base: 2;
}
