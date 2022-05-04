#!/usr/bin/env raku

my &idm = -> $size { gather for ^$size -> $y { take map { Int($_ == $y) }, ^$size } };
.join(' ').say for idm(5);

