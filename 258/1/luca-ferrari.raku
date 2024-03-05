#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
    (10, 1, 111, 24, 1000).map( { $_.comb.elems %% 2 ?? 1 !! 0 } ).sum.say;

#}
