#!/usr/bin/env raku

.put for (0..50).grep: { $_ %% [+] .comb };
