#!/usr/bin/env perl
use v5.36;

use List::Util 'all';

sub main (@ints) {
    # Loop through each position of the list
    foreach my $i ( 0 .. $#ints ) {
        # Make a new list with the integer at that position remove
        my @new_list = @ints;
        splice( @new_list, $i, 1 );

        # Check if the list is incremental
        if ( all { $new_list[ $_ - 1 ] <= $new_list[$_] } ( 1 .. $#new_list ) )
        {
            # It is, tell the user about it
            say 'true';
            return;
        }
    }

    # Oh dear. No solution is possible
    say 'false';
}

main( (0, 2, 9, 4, 6) ) ;
