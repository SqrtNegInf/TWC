#!/usr/bin/env raku

##unit sub MAIN (*@int where @int.elems > 0 && all(@int) ~~ Int);
my @int = (2, 1, 3, 2);

say @int.Bag.grep( *.value == 1 ).map( *.key ).sum;
