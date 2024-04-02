#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints  =(3,1,2,2,2,1,3);

my \k = @ints.pop;
put +(^+@ints).combinations(2).grep(-> (\a,\b) { @ints[a] == @ints[b] and a*b %% k });
