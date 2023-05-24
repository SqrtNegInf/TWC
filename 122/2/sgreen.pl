#!/usr/bin/env perl
use v5.36;

sub _score {
    my ( $remaining, $these_shots ) = @_;

    if ( $remaining <= 3 ) {
        # Display this score
        say join ' ', @$these_shots, $remaining;
    }

    foreach my $shot ( 1, 2, 3 ) {
        # Call the recursive function again
        _score( $remaining - $shot, [ @$these_shots, $shot ] ) if $remaining > $shot;
    }
}

sub main {
    my $S = shift;

    # Call a recursive function to calculate the possible shots
    _score( $S, [] );
}

main(4);
