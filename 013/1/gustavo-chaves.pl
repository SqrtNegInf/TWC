#!/usr/bin/env perl

use 5.026;
use strict;
use autodie;
use warnings;
use DateTime;

my $year = 2019;

for my $month (1 .. 12) {
    my $date = DateTime->last_day_of_month(
        year => $year,
        month => $month,
        time_zone => '+0000',
    );
    printf "%4d/%02d/%02d\n", $year, $month, $date->day() - ($date->day_of_week()+2)%7;
}
