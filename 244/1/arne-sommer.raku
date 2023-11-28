#!/usr/bin/env raku

#unit sub MAIN (*@int where @int.elems > 0 && all(@int) ~~ Int);
my @int = (8, 1, 2, 2, 3);

say "(" ~ @int.map({ @int.grep( * < $_ ).elems }).join(", ") ~ ")";
