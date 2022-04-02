#!/usr/bin/env raku

sub slide($w, @a where @a >= $w) {
    (0..@a-$w).map({ @a.[$_..^$_+$w].min })
}

say slide(3, (1, 5, 0, 2, 9, 3, 7, 6, 4, 8).map(*.Int));
