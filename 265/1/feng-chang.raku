#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = (1,2,3,3,3,3,4,2);

my %counts = @ints.Bag;
put %counts.keys».Int.grep({ %counts{$_}/+@ints ≥ 0.33 }).min;
