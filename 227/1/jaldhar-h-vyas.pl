#!/usr/bin/env perl
use v5.36;

use DateTime;
#use English;

my $count = 0;

my $year = 2023; 
for my $month (1 .. 12) {
    my $date = DateTime->new(year => $year, month => $month,  day => 13);
    if ($date->day_of_week == 5) {
        $count++;
    }
}

say $count;
