#!/usr/bin/env raku

.say if ($_ %% [+] .comb) for 0..50;
