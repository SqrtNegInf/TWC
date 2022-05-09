#!/usr/bin/env raku

my %letters = bag <c r a t e>;

WORD:
for 'words'.IO.lines -> $word {
    my %counter = %letters;
    next WORD unless %counter{$_}-- for $word.fc.comb;
    say $word;
}


