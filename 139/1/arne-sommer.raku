#!/usr/bin/env raku

#unit sub MAIN (*@n where @n.elems >= 1 && all(@n) ~~ Numeric);

my @n = (^1000).pick(*);

my @sorted = @n.sort;

say + ( [<=] @n );
