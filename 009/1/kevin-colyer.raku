#!/usr/bin/env raku

for (100..10_000) -> $i { my $j=$i**2; "$i -> $j".say && last if $j.comb.unique.elems==5 };
