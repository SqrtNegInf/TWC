#!/usr/bin/env raku

say (10, 1, 111, 24, 1000).grep( {$_.chars %% 2}  ).elems ;
