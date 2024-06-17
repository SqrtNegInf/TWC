#!/usr/bin/env raku

my ($string,$char) = 'ballerina','e';
( $string.comb.grep( * ~~ $char ).elems / $string.comb.elems * 100 ).Rat.round.say;
