#!/usr/bin/env perl
use v5.36;

use List::Util qw(max sum0);

say count_candies((1, 4, 3, 2));

sub count_candies(@candidates) {
    my $descending;
    my @candies;
    for my $i ( 0 .. $#candidates ) {

        if ( $i > 0 && $candidates[ $i - 1 ] < $candidates[$i] ) {
            $candies[$i] = $candies[ $i - 1 ] + 1;
        }
        else {
            $candies[$i] = 1;
        }

        if ( $i < $#candidates && $candidates[$i] > $candidates[ $i + 1 ] ) {
            $descending++;
        }
        else {
            while ($descending) {
                my $candies = $descending + 1;
                if ( $candies[ $i - $descending ] < $candies ) {
                    $candies[ $i - $descending ] = $candies;
                }
                $descending--;
            }
        }
    }
    return sum0(@candies);
}

