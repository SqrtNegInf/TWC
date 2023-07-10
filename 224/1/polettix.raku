#!/usr/bin/env raku

sub MAIN ($s = "scriptinglanguage", $t = "perl") { put(([(-)] ($t, $s)».comb».Bag).elems == 0) }
