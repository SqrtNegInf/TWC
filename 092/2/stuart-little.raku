#!/usr/bin/env raku
use v6;

# run as <script> <space-separated ordered interval endpoints, with the interval to be inserted coming first>

sub endpts(@a) {
    (@a (-) @a.map(*+1)).keys.sort Z (@a.map(*+1) (-) @a).keys.sort
}

say <5 8 1 2 3 7 8 10>.map(*.Int).Hash.map({ $_.key.Int ..^ $_.value }).reduce(&infix:<(+)>).Set.keys.sort.&endpts
