#!/usr/bin/env raku

#unit sub MAIN (*@int where @int.elems > 0 && all(@int) ~~ UInt && @int.max <= @int.end);
my @int = (0, 2, 1, 5, 3, 4);

my @output = (^@int.elems).map({ @int[@int[$_]] });

say "({ @output.join(", ") })";
