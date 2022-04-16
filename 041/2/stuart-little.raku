#!/usr/bin/env raku

say (1, 1, { $^a + $^b +1} ... *).[^20]
