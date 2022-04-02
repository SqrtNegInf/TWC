#!/usr/bin/env raku

sub min-sliding-window(@A, $S) {
    gather for 0..@A.elems-$S -> $i {
        take min(@A[$i..$i+$S-1]);
    }
}

min-sliding-window((1, 5, 0, 2, 9, 3, 7, 6, 4, 8), 3).say;
