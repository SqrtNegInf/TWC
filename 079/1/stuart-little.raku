#!/usr/bin/env raku

sub bits($n) {
    (1..$n).map(*.base(2)).join.indices(1).elems % 1000000007
}

say bits(4);
