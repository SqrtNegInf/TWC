#!/usr/bin/env raku

sub MAIN( Int $limit = 100 ) {

    for 1 .. $limit {
        $_.say if ! ( $_ + $_.flip.Int ).comb.grep( * %% 2 );
    }
}
