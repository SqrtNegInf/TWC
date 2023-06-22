#!/usr/bin/env perl
use v5.36;

use DateTime;

foreach my $month (1..12) {
    my $dt = DateTime->last_day_of_month(year => 2019, month => $month);
    while ($dt->day_of_week() != 5) {
        $dt->subtract(days => 1);
    }
    say $dt->ymd(q|/|);
}
