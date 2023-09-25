#!/usr/bin/env perl
use v5.36;

sub main (@ints) {
    # For zeros in the list, double it
    my @solution = map { $_ ? $_ : ( 0, 0 ) } @ints;

    # Truncate the list, and print it
    splice( @solution, scalar(@ints) );
    say join ', ', @solution;
}

main( (1, 0, 2, 3, 0, 4, 5, 0) );
