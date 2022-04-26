#!/usr/bin/env raku

sub grad(@arr, $step=1) {
    (1..(@arr.elems - $step)).map({ @arr[$_ + $step] - @arr[$_] });
}

quietly grad((5, 9, 2, 8, 1, 6), 1).say;
