#!/usr/bin/env perl
use v5.36;

use List::Util 'min';

sub main (@ints) {
    # Get the minimum value
    my $moves   = 0;
    my $min_int = min(@ints);

    while ( scalar @ints ) {
        ++$moves;
        my $value = shift @ints;

        # If this is the minimum value, calculate the new minimum value
        if ( $value == $min_int ) {
            if ( scalar(@ints) ) {
                $min_int = min(@ints);
            }
        }
        else {
            # Move it to the end
            push @ints, $value;
        }
    }

    say $moves;
}

main( (3, 4, 2) );
