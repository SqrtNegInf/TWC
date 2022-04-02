#!/usr/bin/env raku

sub maj(@a) {
    @a.grep({ @a.grep($_).elems > floor(@a/2) }).[0] || -1
}

say maj( (1, 2, 2, 3, 2, 4, 2) );
