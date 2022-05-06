#!/usr/bin/env raku

say first map ^∞: *²: *.comb.Set ≥ 5;
