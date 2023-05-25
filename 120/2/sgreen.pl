#!/usr/bin/env perl
use v5.36;

sub main {
    my $time = shift //  '03:10';
    my ( $hour, $minute ) = ( $time =~ /^([0-9]+):([0-9]+)$/ );

    # Telling time is silly. If the hour value is 12, make it zero.
    $hour = 0 if $hour == 12;

    # Calculate the angle of each hand (from the 12:00 position)
    my $angle_min  = 360 * $minute / 60;
    my $angle_hour = 360 * ( $hour / 12 + $minute / 720 );

    # Calculate the delta between the two hands
    my $delta = abs( $angle_min - $angle_hour );

    # If the angle is > 180°, we can get a shorter angle from the other side.
    $delta = 360 - $delta if $delta > 180;

    say $delta . '°';
}

main(@ARGV);
