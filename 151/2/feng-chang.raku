#!/usr/bin/env raku

#unit sub MAIN(*@V);

my @V = (4, 2, 3, 6, 5, 3);

put max-gain(@V);

multi max-gain()                        { 0 }
multi max-gain(@V where *.elems == 1|2) { @V.max }
multi max-gain(@V --> UInt:D)           { max(@V[0] + max-gain(@V.tail(*-2)), max-gain(@V.tail(*-1))) }
