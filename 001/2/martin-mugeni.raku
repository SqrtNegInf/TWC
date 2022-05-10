#!/usr/bin/env raku

say 'fizz'x!($_ % 3) ~  'buzz'x!($_ % 5) || 'fizzbuzz'x!($_ % 15) || $_ for 1 .. 20;
