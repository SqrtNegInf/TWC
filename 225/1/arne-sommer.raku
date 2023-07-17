#!/usr/bin/env raku

#unit sub MAIN (*@list);
my @list = ["Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference."];

say @list>>.split(" ")>>.elems.max;
