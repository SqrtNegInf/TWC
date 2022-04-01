#!/usr/bin/env raku

my $N = 51;
my @p = gather for (2..^$N) { .take if .is-prime }
say @p.combinations.grep( {.sum == $N} ).sort( {$^a.elems > $^b.elems } ).first.elems
