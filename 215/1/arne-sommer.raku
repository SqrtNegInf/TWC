#!/usr/bin/env raku

#unit sub MAIN (*@words where @words.elems > 0 && all(@words) ~~ /^<[a..z]>+$/);
my @words = ('abc', 'xyz', 'tsu');

say @words.grep({ ! [<=] $_.ords }).elems;
