#!/usr/bin/env perl
use v5.36;
use DateTime;

my $year = 2022;
for my $month (1..12) {
    my $dt = DateTime->last_day_of_month(year => $year, month => $month);
    my $days_to_sunday = $dt->day_of_week % 7;
    my $final_sunday = $dt->day - $days_to_sunday;
    printf "%d-%02d-%02d\n", $year, $month, $final_sunday;
}
