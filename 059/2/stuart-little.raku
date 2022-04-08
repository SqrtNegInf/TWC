#!/usr/bin/env raku

say (2,3,4).map(*.Int).combinations(2).map({ ($_[0] +^ $_[1]).base(2).comb.grep(1).elems }).sum
