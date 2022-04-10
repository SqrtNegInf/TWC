#!/usr/bin/env raku

unit sub MAIN (Int $n where $n >= 1 = 3, Int $k where $k >= 1 = 4);

say (1..$n).permutations[$k-1].join;
