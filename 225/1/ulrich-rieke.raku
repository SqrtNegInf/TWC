#!/usr/bin/env raku

my @sentences = ["Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference."];
say @sentences.map( {.words} ).map( {.elems} ).max ;
