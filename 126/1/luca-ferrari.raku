#!/usr/bin/env raku

sub MAIN( Int $N = 200) {
    ( 1 .. $N ).grep( * !~~ / 1 / ).elems.say;
}
