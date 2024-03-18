#!/usr/bin/env raku

sub MAIN( $word  = 'CAT' ) {
    say $word.comb.permutations.map( *.join ).sort.grep( * ~~ $word, :k ).first + 1;
}
