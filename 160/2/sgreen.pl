#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

sub main {
    my @n = @_;

    my $idx = -1;

    foreach my $i ( 1 .. $#n - 1 ) {
        # If the sum of digits to the left match the sum of digits to the
        #  right, we have found a solution.
        if ( sum( @n[ 0 .. $i - 1 ] ) == sum( @n[ $i + 1 .. $#n ] ) ) {
            $idx = $i;
            last;
        }
    }

    say $idx;
}

main((1, 3, 5, 7, 9));
