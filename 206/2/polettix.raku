#!/usr/bin/env raku

put array-pairings([1,2,3,4,5,6]);
sub array-pairings (Array[Int]() $array) { $array.sort[0, 2 ... *].sum }
