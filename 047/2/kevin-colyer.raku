#!/usr/bin/env raku

use Test;

# make a lazy sequence 100 to infinity
my @gapful = (100...Inf)
        # filter each number with grep
    .grep: {
        # keeping it if it divides with no remainder it's first character * 10 plus its last character
        $_ %% ( $_.substr( 0, 1 ) * 10 + $_.substr( *-1, 1 ) )
    };

# select counting up to 20 from 0, pass the list to say with a hyper operation
@gapful[^20]>>.say;
