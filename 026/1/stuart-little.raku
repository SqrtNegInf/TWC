#!/usr/bin/env raku

say 'abcde'.comb.grep({ 'cdfg'.contains($_) }).elems
