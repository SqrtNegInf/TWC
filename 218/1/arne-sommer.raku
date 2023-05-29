#!/usr/bin/env raku

#unit sub MAIN (*@list where @list.elems >= 3 && all(@list) ~~ Int);
my @list = ( -8,  2, -9,  0, -4, 3);

say @list.combinations(3)>>.reduce(&infix:<*>).max;
