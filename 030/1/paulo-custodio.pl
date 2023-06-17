#!/usr/bin/env perl
use v5.36;

use DateTime;

my @sunday_xmas;
for my $year (2019..2100) {
    my $date = DateTime->new(year=>$year, month=>12, day=>25);
    push @sunday_xmas, $year if $date->day_of_week == 7;
}

say join(", ", @sunday_xmas);
