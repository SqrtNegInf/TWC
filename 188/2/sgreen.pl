#!/usr/bin/env perl

use v5.36;
sub main ( $x, $y ) {
    my $count = 0;

    while ( $x != 0 or $y != 0 ) {
        $count++;

        # Take the smaller number from the bigger number
        if ( $x > $y ) {
            $x -= $y;
        }
        elsif ( $y > $x ) {
            $y -= $x;
        }
        else {
            # or if they are the same, off each other
            $x = $y = 0;
        }
    }

    say $count;
}

main(4,6);
