#!/usr/bin/env raku

say (1..*).map(* ** 2).first({ $_.comb.unique.elems >= 5 })
