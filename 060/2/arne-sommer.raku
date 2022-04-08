#!/usr/bin/env raku

subset PositiveIntZero of Int where * >= 0;
subset PositiveInt of Int where * > 0;

unit sub MAIN (PositiveInt $X=2, PositiveInt $Y=21, @L =(0, 1, 2, 5));

(@L xx $X).flat.combinations(1..$X)>>.join>>.Int.unique.sort.grep({ .chars == $X && $_ < $Y }).join(", ").say





