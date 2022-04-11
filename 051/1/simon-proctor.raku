#!/usr/bin/env raku

my  $target = 0,
my @values = -25, -10, -7, -3, 2, 4, 8, 10;
.say for @values.combinations(3).grep( { ([+] $_) == $target } ).map( *.join(",") );
