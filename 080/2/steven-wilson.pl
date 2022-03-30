#!/usr/bin/env perl
# Solution by Steven Wilson 3rd Oct 2020.

use strict;
use warnings;
use feature qw/ say /;
use Test::More;
use List::Util qw/ sum /;

my @N1_t = ( 1, 2, 2 );
my @N2_t = ( 1, 4, 3, 2 );
my @N3_t = ( 1, 1, 2, 3 );
my @N4_t = ( 3, 1, 2, 1 );
ok( get_total_candies( \@N1_t ) == 4, "example 1" );
ok( get_total_candies( \@N2_t ) == 7, "example 2" );
ok( get_total_candies( \@N3_t ) == 7, "last ranking higher" );
ok( get_total_candies( \@N4_t ) == 6, "first ranking higher" );
done_testing();

sub get_total_candies {
    my $rankings_ref    = shift;
    my @rankings        = @{$rankings_ref};
    my @candies         = map { 1 } 1 .. scalar @rankings;
    my $candies_changed = 1;
    while ($candies_changed) {
        $candies_changed = 0;
        for my $i ( 0 .. ( scalar @rankings - 2 ) ) {
            if ( $rankings[$i] > $rankings[ $i + 1 ]
                && !( $candies[$i] > $candies[ $i + 1 ] ) )
            {
                $candies[$i]++;
                $candies_changed = 1;
            }
            elsif ( $rankings[$i] < $rankings[ $i + 1 ]
                && !( $candies[$i] < $candies[ $i + 1 ] ) )
            {
                $candies[ $i + 1 ]++;
                $candies_changed = 1;
            }
        }
    }
    return sum @candies;
}

