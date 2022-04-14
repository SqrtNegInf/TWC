#!/usr/bin/env raku

sub encode($str) { (roundrobin (S:g/\s// with $str.lc).comb.rotor(8,:partial)).map(*.join).Str }

say "The quick brown fox jumps over the lazy dog".&encode
