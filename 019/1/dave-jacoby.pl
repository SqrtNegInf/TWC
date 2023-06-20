#!/usr/bin/env perl
use v5.36;

use DateTime;

my @months = (1, 3, 5, 7, 8, 10, 12);

# We only need one DateTime object.
# We'll set the month, day and year as needed

my $date = DateTime->now();
$date->set_day(1);
for my $year ( 1900 .. 2019 ) {
    $date->set_year($year);
    for my $month ( @months ) {
        $date->set_month($month);
        say $date->ymd if 5 == $date->day_of_week;
    }
}
