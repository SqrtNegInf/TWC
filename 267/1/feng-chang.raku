#!/usr/bin/env raku

unit sub MAIN(@ints = (-1, -2, -3, -4,  3,  2,  1));

put [*] @ints».sign;
