#!/usr/bin/env raku

# Usage:
#   raku ./challenge-080/gugod/raku/ch-1.raku 1 2 18 4 5
#   3

my $N = (5, 2, -2, 0).map({ .Int }).Set();

(1..*).first(-> $n { ! $N{$n} }).say;
