#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use experimental 'signatures';

sub main (@n) {

    # If the last value is less than the first, reverse it
    if ( $n[0] > $n[-1] ) {
        @n = reverse @n;
    }

    # Go through the positions 0 .. len(n)-2
    foreach my $i ( 0 ... $#n - 1 ) {
        if ( $n[$i] > $n[ $i + 1 ] ) {
            # If the earlier value is higher, we don't have a solution
            say '0';
            return;
        }
    }

    # We have a solution
    say '1';
}

main( (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19) );
