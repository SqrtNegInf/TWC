#!/usr/bin/env raku

subset PosInt of Int where * >= 1;

unit sub MAIN (*@ints where @ints.elems > 0 && all(@ints) ~~ PosInt);

say "({ @ints.map( *.comb ).flat.join(", ") })";