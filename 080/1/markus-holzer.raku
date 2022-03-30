#!/usr/bin/env raku
#unit sub MAIN( *@N where .all ~~ Int );

my @N = (5, 2, -2, 0);

given (1..@N.max) ∖ (@N>>.Int) {
    say .elems 
        ?? "Smallest missing element is {.min.key}"
        !! "No missing elements" } 
