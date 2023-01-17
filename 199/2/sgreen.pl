#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use experimental 'signatures';

use Algorithm::Combinatorics 'combinations';

my @array = (7,2,3,3,0,1,1,9,7);
    # Get the x, y, and z values from the input
    my ( $x, $y, $z ) = splice( @array, -3 );

    # The solution is the number of good triplets.
    my $count = 0;

    # Work through all combinations of positions
    my $iter = combinations( [ 0 .. $#array ], 3 );
    while ( my $x = $iter->next ) {
        my ( $i, $j, $k ) = sort { $a <=> $b } @$x;

        # If we match the criteria, add one to the count
        if (    abs( $array[$i] - $array[$j] ) <= $x
            and abs( $array[$j] - $array[$k] ) <= $y
            and abs( $array[$i] - $array[$k] ) <= $z )
        {
            $count++;
        }
    }

    say $count;
