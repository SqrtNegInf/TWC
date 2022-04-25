#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;
use Math::Trig;    # mainly for Pi

sub get_mean {
    my @angles = @_;

    my ( $sin_sum, $cos_sum );

    for (@angles) {
        $sin_sum += sin( deg2rad($_) );
        $cos_sum += cos( deg2rad($_) );
    }


    return rad2deg( atan2( $sin_sum, $cos_sum ) );
}

say get_mean((180,270,360));

# TESTS
use Test::More;

is( get_mean( 0, 0, 90 ), 26.565051177078 );

done_testing;
