#!/usr/bin/env raku

#unit sub MAIN(*@ints where .all ~~ Int);
my @ints = (5, 2, -2, 0);

say $_ ?? .min.key !! 1 with (1..@ints.max+1) (-) @ints.map(+*); 
