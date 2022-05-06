#!/usr/bin/env raku

say (1..*).map( * ** 2 ).grep( { set( $_.comb ).keys.elems >=5 } )[0];
