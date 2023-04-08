#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings;
use feature 'say';
use experimental 'signatures';

sub main (@n) {
    my @solutions = ();

    foreach my $start ( 0 .. $#n - 2 ) {
        # Calculate the difference between the first two values
        my $diff = abs( $n[$start] - $n[ $start + 1 ] );

        foreach my $end ( $start + 2 .. $#n ) {
            if ( abs( $n[$end] - $n[ $end - 1 ] ) == $diff ) {
                # We have a solution
                push @solutions, '(' . join( ', ', @n[ $start .. $end ] ) . ')';
            }
            else {
                last;
            }
        }
    }

    if (@solutions) {
        say join ', ', @solutions;
    }
    else {
        say '()';
    }
}

main(<9 1 2 3 4 4 3 2 1 9>);
