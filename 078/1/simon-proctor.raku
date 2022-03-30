#!/usr/bin/env raku

my @a = <9 10 7 5 6 1>;
@a.kv.map( -> $i, $v { $v > all(@a[$i^..*]) ?? $v !! Empty }).join(", ").say;
