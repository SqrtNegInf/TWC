#!/usr/bin/env raku

my @words = 'Perl Weekly Challenge';

my @broken = @words.tail.lc.comb;
put +@words.grep(*.lc.comb.any ne @broken.any);
