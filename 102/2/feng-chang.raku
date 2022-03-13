#!/usr/bin/env raku

sub MAIN(UInt:D \N = 20) {
    my Str:D  $s   = '#';
    my UInt:D $pos = N;

    while $s.chars < N {
        $s   = $pos ~ $s;
        $pos = N - $s.chars;

        $s = '#' ~ $s if $s.chars < N;
    }

    put $s;
}
