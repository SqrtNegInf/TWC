#!/usr/bin/env raku

sub MAIN(UInt:D $N where * ≥ 10 = 34) {
    put $N.comb».Int.map(*²).reduce(&infix:<+>).&{ +(sqrt($_).Int² == $_) };
}
