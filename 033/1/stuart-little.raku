#!/usr/bin/env raku

for '../00-blogs'.IO.slurp.lc.comb.grep({ $_ ~~ /<[a..z]>/}).classify({ $_ }).map({ $_.key => $_.value.elems }).sort(*.key) {.say}
