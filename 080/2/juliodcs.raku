#!/usr/bin/env raku
my @N = (1, 4, 3, 2);

say @N.elems + elems (^@N.elems.pred).grep: { @N[$_] != @N[.succ] };
