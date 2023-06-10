#!/usr/bin/env perl
use v5.36;

diffk( 2, 2, 7, 9 );

## k is positive, N is sorted, so i will have to be higher than j
sub diffk ( $k, @N ) {
    for my $j ( 0 .. -1 + scalar @N ) {
        for my $i ( $j + 1 .. -1 + scalar @N ) {
            say join ", ", $i, $j if $k == $N[$i] - $N[$j];
        }
    }

}
