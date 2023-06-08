#!/usr/bin/env perl
use v5.36;

my ($int) = 64;

say power_integers($int);

sub power_integers {
    my ($int) = @_;

    my ( $factor, $power ) = get_factor_and_power($int);
    if ( defined($power) and $power > 0 ) {
        return $factor . '^' . $power;
    }
    else {
        return 0;
    }
}

sub get_factor_and_power {
    my ($int) = @_;

    # try those factors naively
    my $factor;
    my $max_factor = int( sqrt($int) );
    foreach my $potential_factor ( 2 .. $max_factor ) {
        if ( $int % $potential_factor == 0 ) {
            $factor = $potential_factor;

            # verify that the factor is powerful enough
            my $power = 1;
            while ( $factor**$power < $int ) {
                $power++;
            }
            return ( $factor, $power ) if ( $factor**$power == $int );
        }
    }
    return 0;
}

