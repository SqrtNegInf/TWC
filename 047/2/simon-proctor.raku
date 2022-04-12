#!/usr/bin/env raku

sub MAIN (
    UInt $count = 20 #= Number of gapful numbers to calulate (default 20)
) {
    .say for (100..*).grep( { $^a %% $^a.comb[0,*-1].join.Int } )[^$count]
}
