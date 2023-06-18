#!/usr/bin/env perl
use v5.36;

sub get_intersection {

    my ( $a, $b, $c, $d, $p, $q, $r, $s ) = @_;
    #     x1  y1  x2  y2  x3  y3  x4  y4

    my $det = ( $a - $c ) * ( $q - $s ) - ( $b - $d ) * ( $p - $r );
    return 0 if $det == 0;

    # Let's assume the lines are infinitely long
    my $px = ( $a * $d - $b * $c ) * ( $p - $r ) - ( $a - $c ) * ( $p * $s - $q * $r ) / $det;

    my $py = ( $a * $d - $b * $c ) * ( $q - $s ) - ( $b - $d ) * ( $p * $s - $q * $r ) / $det;

    return ( [ $px, $py ] );
}

#my ($result) = &get_intersection(@ARGV);
#say "Intersection : $result->[0] , $result->[1]";

# TESTS
use Test::More;

is_deeply( \&get_intersection( 0, 0, 2, 0, -4, -5, 8, 1 ), \[ 6, 0 ] );
is_deeply( \&get_intersection( 0, 0, 2, 0, -4, -5, 8, 0 ), \[ 8, 0 ] );
is_deeply( \&get_intersection( 0, 0, 2, 1, -4, -5, 2, 1 ), \[ 2, 1 ] );

is( &get_intersection( 1, 2, 3, 4, 5, 6, 7, 8 ), 0 );

done_testing;

