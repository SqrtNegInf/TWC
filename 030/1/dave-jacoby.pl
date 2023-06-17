#!/usr/bin/env perl
use v5.36;
use DateTime;

for my $year ( 2019 .. 2100 ) {
    my $dt = DateTime->new(
        year      => $year,
        month     => 12,
        day       => 25,
        hour      => 12,
        minute    => 0,
        second    => 0,
        time_zone => 'floating'
    );
    if ( 6 == $dt->day_of_week_0() ) { say $dt->date }
}
