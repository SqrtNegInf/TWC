#!/usr/bin/env raku

say 0;
for (1..(@*ARGS[0] || 50).Int).grep({ $_ %% $_.comb.sum }) {.say}
