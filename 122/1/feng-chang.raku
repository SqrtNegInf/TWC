#!/usr/bin/env raku

my @N = <10 20 30 40 50 60 70 80 90 100>;
put (^@N.elems).map({ @N[0..$_].sum / ($_+1) });
