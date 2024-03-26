#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = (1, 2, 3, 45);

put @ints.sum - @ints».comb».sum.sum;
