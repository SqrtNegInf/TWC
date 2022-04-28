#!/usr/bin/env raku

unit sub MAIN(Str $string = 'bookkeeper');

my Str @split = $string.comb: / (.) $0 * /;

@split».put
