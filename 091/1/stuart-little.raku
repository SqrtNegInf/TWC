#!/usr/bin/env raku

say 1122234.comb(/(\d)$0*/).map(*.comb).map({ $_.elems, $_[0] }).flat
