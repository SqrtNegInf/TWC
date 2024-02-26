#!/usr/bin/env raku

#unit sub MAIN (*@ints where @ints.elems > 1 && all(@ints) ~~ Int);
my @ints = (5, 2, 1, 6);

say "({ @ints.map({ @ints.grep( * < $_ ).elems }).join(", ") })";
