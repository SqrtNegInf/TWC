#!/usr/bin/env raku

say (1,2,4,8 ... *).grep({ ($_-1).is-prime }).head(5).map({ ($_ div 2)*($_-1) })
