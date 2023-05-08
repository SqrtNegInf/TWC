#!/usr/bin/env raku

#unit sub MAIN(*@S);

my @S = ('abc', 'xyz', 'tsu');
put +@S.grep({ ![lt] .comb });
