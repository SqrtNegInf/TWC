#!/usr/bin/env raku
unit sub MAIN($N where * > 0  = 4);

say (1..$N).map(*.base(2)).comb(/1/).elems mod 1000000007;
