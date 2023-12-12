#!/usr/bin/env raku

use Test;

srand 1;

my @l = 1 … 6;
say "Output:";
.say for (1…49).pick( 6);
