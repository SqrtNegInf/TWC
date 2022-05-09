#!/usr/bin/env raku

sub MAIN (Int :$size = 10) {
    say .join(" ")
        for (1,), { |$_, 0 Z+ 0, |$_ } ... *.elems == $size;
}
