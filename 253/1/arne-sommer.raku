#!/usr/bin/env raku

#unit sub MAIN ($separator where $separator.chars == 1,
#               *@words where @words.elems > 0);

my $separator = '.';
my @words = ('one.two.three', 'cat.dog.pig');

say @words>>.split($separator).[*;*].grep( *.chars ).map( '"' ~ * ~ '"' ).join(",");
