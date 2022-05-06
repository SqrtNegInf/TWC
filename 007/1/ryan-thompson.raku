#!/usr/bin/env raku

.say for (0..50).grep: { $_ %% .comb.sum }
