#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = (1, 5, 3, 2, 4, 2);

my \k = 2;
put @ints.sort.grep(k, :k).gist;
