#!/usr/bin/env raku

my @ints = (5, 7, 1, 7);

put +@ints.unique.combinations(2).grep(-> (\a,\b) { abs(a - b) < min(a, b) });
