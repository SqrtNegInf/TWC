#!/usr/bin/env raku

sub subsort(@arr, @ind) {
    @arr[@ind] = @arr[@ind].sort; @arr;
}

say subsort([10, 4, 1, 8, 12, 3], [0, 2, 5]);
