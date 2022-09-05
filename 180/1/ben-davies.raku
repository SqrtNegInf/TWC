#!/usr/bin/env raku

unit sub MAIN(Str:D $s = 'Raku Yearly Challenge');
say bag($s.comb).kv.map({ $s.index: $^k if $^v == 1 }).min;
