#!/usr/bin/env perl
# vi:et:sw=4 ts=4 ft=perl

use strict;
use warnings;
use utf8;
use feature qw(say);
use DateTime;

foreach my $month (1..12) {
    my $dt = DateTime->last_day_of_month(year => 2019, month => $month);
    while ($dt->day_of_week() != 5) {
        $dt->subtract(days => 1);
    }
    say $dt->ymd(q|/|);
}
