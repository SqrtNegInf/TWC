#!/usr/bin/env raku

for (0..((@*ARGS) ?? (@*ARGS[0].Int) !! (50))).map({ "Decimal: $_ -- Octal: $_.base(8)" }) {.say}
