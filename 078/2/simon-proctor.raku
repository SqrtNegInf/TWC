#!/usr/bin/env raku

#my %*SUB-MAIN-OPTS = :named-anywhere;
#| Given a list of values and some named pivot points rotate the list
#| so that the given pivot is first in the list
#sub MAIN (
#    *@values where { $_.elems > 0 }, #= List to rotate
#    # There's a weird Emacs Raku mode bug with < hence <= elems-1
#    :p(:@pivots)! where { .all ~~ UInt && .all <= @values.elems-1 }, #= List of values to rotate
#) { 
    my @values = (10,20,30,40,50); my @pivots = (3,4);
    for @pivots -> $p {
        [ |@values[$p..*], |@values[0..^$p] ].say
    }

#}
