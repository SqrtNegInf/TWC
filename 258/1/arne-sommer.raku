#!/usr/bin/env raku

#subset PosInt of Int where * >= 1;

#unit sub MAIN (*@ints where @ints.elems > 0 && all(@ints) ~~ PosInt);

say (10, 1, 111, 24, 1000).grep( *.chars %% 2 ).elems;
