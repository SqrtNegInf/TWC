#!/usr/bin/env perl

use v5.36;
use DateTime;
foreach my $year(2022){
    say "\nLast Sundays of year $year:";
    say $_->subtract(days=>$_->day_of_week%7)->ymd for
        map {DateTime->last_day_of_month(year=>$year, month=>$_)} (1..12)
}
