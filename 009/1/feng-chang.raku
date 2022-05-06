#!/usr/bin/env raku

my $n = (101 ... *).map({ $_ if ($_ * $_).comb.unique.elems >= 5 }).[0];
say $n * $n, " = $n * $n";
