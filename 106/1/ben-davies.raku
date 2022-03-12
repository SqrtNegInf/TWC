#!/usr/bin/env raku

unit sub MAIN(@n = <1 3 8 2 0> ) {
    say @n.sort(&[R<=>]).rotor(2 => -1).map(&[-] ∘ |*).max;
}
