#!/usr/bin/env raku

subset PosInt of Int where * >= 1;

#unit sub MAIN (*@ints where @ints.elems > 0 && all(@ints) ~~ PosInt);
my @ints = [1,34,5,6];

say "({ @ints.map( *.comb ).flat.join(", ") })";
