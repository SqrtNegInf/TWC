#!/usr/bin/env raku

say (1..*).map(* * $_).first({ ($_.comb (-) ('0','1')).elems==0 }) with 743;
