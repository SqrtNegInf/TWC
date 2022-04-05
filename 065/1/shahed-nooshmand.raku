#!/usr/bin/env raku

my ($N,$S) = (2,10);
(10**($N-1)..^10**$N).grep(*.comb.sum == $S).say
