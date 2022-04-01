#!/usr/bin/env raku

sub largest-rec-hist(@A) {
    my @largest-sub-rec = [];
    for 0..(@A.elems - 1) -> $i {
        for ($i + 1)..(@A.elems - 1) -> $j {
            @largest-sub-rec.push(($j - $i + 1) * @A[$i..$j].min);
        }
    }
    return @largest-sub-rec.max;
}

largest-rec-hist((2, 1, 4, 5, 3, 7)).say;
largest-rec-hist((3, 2, 3, 5, 7, 5)).say;
