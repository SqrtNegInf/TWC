#!/usr/bin/env raku

unit sub MAIN(@N = <1 2 2 4>);

put "Duplicate: { @N.Bag.grep({ .value > 1 }).Hash.keys || 'null' } and ",
    "Missing: { ((@N[0] .. +@N) (-) @N».Int)            || 'null' }";
