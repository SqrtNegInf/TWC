#!/usr/bin/env perl
use v5.36;

use DateTime;

my @months_with_31_days = (1, 3, 5, 7, 8, 10, 12);

for my $year (1900 .. 2019) {
    for my $month (@months_with_31_days) {
        my $first_day_of_month = DateTime->new(
            year  => $year,
            month => $month,
            day   => 1,
        );
        if ($first_day_of_month->day_of_week() == 5) {
            printf "%04d-%02d\n", $year, $month;
        }
    }
}
