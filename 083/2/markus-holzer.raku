#!/usr/bin/env raku

#unit sub MAIN( *@A );

my @A = (2,13,10,8);
#my @A = <20 20 20 19 18 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1>; # too slow

my &less-than-zero = *.grep: * < 0;

say +less-than-zero               # find and count all negative numbers of
    ( [X] map { +$_, -$_ }, @A )  # all possible candidates
        .classify( *.sum )        # grouped by sum
        .grep( *.key > -1 )       # filtered where sum is positive
        .sort( *.key )            # sorted by sum
        .head.value               # closest to zero
        .min( &less-than-zero )   # the one with the least flips
