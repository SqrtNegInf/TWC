#!/usr/bin/env raku

sub ldr(@a) {
    @a.[@a.keys.grep({ @a.[$_] == @a.[$_..*].max })]
}

say ldr(<9 10 7 5 6 1>.map(*.Int));
