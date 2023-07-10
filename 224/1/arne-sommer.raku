#!/usr/bin/env raku

unit sub MAIN ($source = "scriptinglanguage", $target = "perl");

say $target.comb.Bag (<=) $source.comb.Bag
  ?? 'true'
  !! 'false';
