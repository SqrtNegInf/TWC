#!/usr/bin/env perl
use v5.36;

use Time::Local;

my @months = (0, 2, 4, 6, 7, 9, 11);

for my $year (1900..2019) {
    for my $month (@months) {
        if (starts_on_friday($year, $month)) {
            printf "%d/%02d\n", $year, $month+1;
        }
    }
}

# does the month starts with a Friday?
sub starts_on_friday($year, $month) {
    my $time = timelocal(undef, undef, undef, 1, $month, $year);
    return (localtime($time))[6] == 5;
}
