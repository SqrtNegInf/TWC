#!/usr/bin/env raku

sub number-combinations($m, $n) {
    return (1..$m).combinations($n);
}

number-combinations(5, 3).say;

