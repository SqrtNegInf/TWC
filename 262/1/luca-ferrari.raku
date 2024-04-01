#!/usr/bin/env raku

my @nums = (-3, 1, 2, -1, 3, -2, 4);
( @nums.grep( * >= 0 ).elems, @nums.grep( * < 0 ).elems ).max.say;
