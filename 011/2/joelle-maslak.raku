#!/usr/bin/env raku

sub MAIN(UInt:D $size where * ≥ 1 = 5) {
    for ^$size -> $row {
        my @row = (^$size).map: { 0 };
        @row[$row] = 1;
        say @row.join(" ");
    }
}

