#!/usr/bin/env raku

say join "\n", (0..50) .grep({($_ > 0) && $_ %% (.Str.comb>>.Int .sum)});

