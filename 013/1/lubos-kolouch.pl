#!/usr/bin/env perl
use v5.36;

use Date::Calc qw/check_date Day_of_Week/;

my $year = 2019;

for my $month (1..12) {
    my $day = 31;

    while ($day) {
        $day-- until check_date($year, $month, $day);

        if (Day_of_Week($year, $month, $day) == 5) {
            say $year.'/'.$month.'/'.$day;
            $day = 1;
        }
        $day--;
    }
}


