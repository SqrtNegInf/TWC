#!/usr/bin/env raku

sub mult-table (UInt $i, UInt $j, UInt $k) {
    say (sort 1..$i X* 1..$j)[$k - 1]
}
#for (2, 3, 4), (3, 3, 6) -> $a, $b, $c {                       # original
for (2, 3, 4), (3, 3, 6), (1000, 999, 314159) -> ($a, $b, $c) { # needed a fix: enclose a/b/c as list
    mult-table $a, $b, $c;
}
