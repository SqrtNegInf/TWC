#!/usr/bin/env raku

unit sub MAIN(@ints = [1024, 512, 256, 128, 64]);

put @ints.sort({ .base(2).comb.sum, $_ });
