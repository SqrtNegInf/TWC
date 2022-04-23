#!/usr/bin/env raku

for ((1..^12) xx 2).reduce(&infix:<X>).grep({ $_[0] + $_[1] < 12 }).map({ $_.[0], $_.[1], 12 - $_.sum }) {.say}
