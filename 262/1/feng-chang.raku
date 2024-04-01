#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = (-3, 1, 2, -1, 3, -2, 4);

my \posis = +@ints.grep(*>0);
put max(posis, +@ints - posis);
