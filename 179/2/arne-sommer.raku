#!/usr/bin/env raku

#subset PositiveInt of Int where * > 0;

#unit sub MAIN (*@numbers where @numbers.elems > 0 && all(@numbers) ~~ PositiveInt);

my @numbers = (15,2500,35,4500,55,65,75,8500);
say @numbers.map({ "▁▂▃▄▅▆▇█".comb.[$_ / max(@numbers) * 7] }).join;
