#!/usr/bin/env raku

unit sub MAIN (@int where all(@int) ~~ Int && @int.elems > 0 = (1, 2, 3, 4, 5) );

my $running-sum := (@int.first, * + @int[1 + state $index++] ... Inf);

say '(' ~ $running-sum[0 .. @int.end].join(", ") ~ ')';
