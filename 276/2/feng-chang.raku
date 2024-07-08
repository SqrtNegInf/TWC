#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = [1, 2, 2, 4, 1, 5];

my %b = @ints.Bag;
my \maxc = %b.values.max;
put +%b.values.grep(maxc) * maxc;
