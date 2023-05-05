#!/usr/bin/env perl
use v5.36;

use DateTime;

my $year = 2022;

for my $month ( 1 .. 12 ) {
    my $dt = DateTime->new(
        year      => $year,
        month     => $month,
        day       => 1,
        time_zone => 'floating'
    );
    $dt->add( days => 32 );

    # Remember that days of week are 1-7, and 0 doesn't match
    # this isn't crontab
    while (1) {
        $dt->subtract( days => 1 );
        next unless $dt->month == $month;
        last if $dt->day_of_week == 7;
    }
    say $dt->ymd;
}
