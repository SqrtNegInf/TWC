#!/usr/bin/env raku

unit sub MAIN(UInt:D $x = 7, UInt:D $y = 2, UInt:D $z = 3, @N = (3,0,1,1,9,7) );

put (^+@N).combinations(3).grep({
    abs(@N[.[0]] - @N[.[1]]) ≤ $x &&
    abs(@N[.[1]] - @N[.[2]]) ≤ $y &&
    abs(@N[.[2]] - @N[.[0]]) ≤ $z
}).elems;
