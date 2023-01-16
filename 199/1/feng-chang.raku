#!/usr/bin/env raku

#unit sub MAIN(*@N);
my @N = (1,2,3,1,2,3);

put @N.unique.map(-> \j {
    @N.grep(j, :k).combinations(2).elems
}).sum;
