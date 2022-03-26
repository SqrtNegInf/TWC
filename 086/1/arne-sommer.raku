#!/usr/bin/env raku

unit sub MAIN (Int $A = 7, @N where @N.elems >= 2 && all(@N) ~~ Int = (10, 8, 12, 15, 5));

say + so any( @N.combinations(2).map({ abs([-] @$_) }) ) == $A;
