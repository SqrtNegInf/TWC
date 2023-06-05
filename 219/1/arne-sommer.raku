#!/usr/bin/env raku

#unit sub MAIN (*@list where @list.elems >= 1 && all(@list) ~~ Int);

say '(' ~ (-2,-1,0,3,4).map( * ** 2 ).sort.join(", ") ~ ')';
