#!/usr/bin/env raku

#sub MAIN (*@sentences) { put @sentences».split(/\s+/)».elems.max }
my @S = ["Perl and Raku belong to the same family.",
           "I love Perl.",
           "The Perl and Raku Conference."];
put @S».split(/\s+/)».elems.max;
