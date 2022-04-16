#!/usr/bin/env raku

.say for (1, 1, * + * + 1 ... Inf).[^20];
