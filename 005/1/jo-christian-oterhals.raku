#!/usr/bin/env raku

my $dict = "words".IO.lines()>>.lc.Set;
#for @*ARGS ?? @*ARGS !! ! $*IN.t ?? lines() !! 'animal' -> $w {
my $w = 'animal';
$w.lc.comb.permutations>>.join.grep({ $dict{$_} and $_ ne $w }).map({ "$w\t$_\n" }).unique.join.say;
