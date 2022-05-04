#!/usr/bin/env raku

sub id($n) { (0..^$n).map({ |(0 xx $_), 1, |(0 xx ($n-$_-1)) }) }

for 5.&id {.say}
