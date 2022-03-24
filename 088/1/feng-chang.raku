#!/usr/bin/env raku

#sub MAIN(*@N) {
my @N = <5 2 1 4 3>;
say @N.map: ([*] @N) / *;
#}
