#!/usr/bin/env raku

    my @list = (1,1,2,2,6,6);
    say @list
    .grep({ $_ % 2 != 1; })
    .classify({ $_ })
    .sort({$^b.value.elems <=> $^a.value.elems || $^a.key <=> $^b.key})
    .first
    .key
    || -1;
