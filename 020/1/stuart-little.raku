#!/usr/bin/env raku

'bookkeeper' ~~ m:g/(.)$0*/; say $/.map(*.Str)
