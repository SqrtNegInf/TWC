#!/usr/bin/env raku

.say for reverse 200, { $^a %% 2 ?? $^a / 2 !! $^a - 1 } ... 1;
