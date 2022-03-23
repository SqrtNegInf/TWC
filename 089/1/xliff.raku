#!/usr/bin/env raku

my $o = (1..100).combinations(2).map({ .[0] gcd .[1] }).sum;
say "Output: $o";
