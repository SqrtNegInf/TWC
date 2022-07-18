#!/usr/bin/env raku

sub MAIN( Int $n where { $n >= 10 } = 5456) {
    my @digits = $n.comb;
    for 0 ..^ @digits.elems - 1 -> $index {
        "Not esthetic $n".say and exit if abs( @digits[ $index ] - @digits[ $index + 1 ] ) != 1
    }

    "$n is esthetic!".say;
}
