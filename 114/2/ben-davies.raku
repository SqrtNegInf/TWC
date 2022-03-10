#!/usr/bin/env raku

sub bits(Int:D $x --> Int:D) { + grep $x +> * +& 1, 0..$x.log2 }
unit sub MAIN($n = 12) {
    my Int:D $bits = $n.&bits;
    say $n && ($n^..*).first(*.&bits == $bits);
}
