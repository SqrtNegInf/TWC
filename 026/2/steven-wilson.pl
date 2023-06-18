#!/usr/bin/env perl
use v5.36;

use Test::More;
use List::Util qw/ sum /;
use Math::Trig;

my @t_angles = qw/ 355 5 15 /;

ok( sprintf( "%.0f", calculate_circular_mean( \@t_angles ) ) == 5, "test circular mean" );
ok( sprintf( "%.3f", mean_sines( \@t_angles ) ) == 0.086, "test mean sines" );
ok( sprintf( "%.3f", mean_cosines( \@t_angles ) ) == 0.986, "test mean cosines" );
done_testing();

my @angles = (180,270,360);

say "Mean of the angles ",
    join( " ", @angles, "is", calculate_circular_mean( \@angles ) );

sub calculate_circular_mean {
    my $ref_angles = shift;
    my @angles     = @{$ref_angles};
    my $s          = mean_sines($ref_angles);
    my $c          = mean_cosines($ref_angles);
    my $mean;
    if ( $s > 0 && $c > 0 ) {
        $mean = rad2deg( atan( $s / $c ) );
    }
    elsif ( $c < 0 ) {
        $mean = rad2deg( atan( $s / $c ) ) + 180;
    }
    else {
        $mean = rad2deg( atan( $s / $c ) ) + 360;
    }
    return $mean;
}

sub mean_cosines {
    my $ref_angles  = shift;
    my @angles      = @{$ref_angles};
    my @cosines     = map { cos( deg2rad($_) ) } @angles;
    my $sum_cosines = sum @cosines;
    return ( $sum_cosines / @angles );

}

sub mean_sines {
    my $ref_angles = shift;
    my @angles     = @{$ref_angles};
    my @sines      = map { sin( deg2rad($_) ) } @angles;
    my $sum_sines  = sum @sines;
    return ( $sum_sines / @angles );
}
