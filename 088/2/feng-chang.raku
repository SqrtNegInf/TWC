#!/usr/bin/env raku

my @N  = ([0,1,2],[3,4,5],[6,7,8]);

my @A;
while (@N) {
    @A.push($_) for @N.shift.Array;
    last unless @N[0].elems > 0;

    @A.push(@N[$_].pop) for ^@N.elems;
    last unless @N.elems > 0;

    @A.push($_) for @N.pop.Array.reverse;
    last unless @N[0].elems > 0;

    @A.push(@N[$_].shift) for @N.elems^...0;
}

put @A;
