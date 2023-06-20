#!/usr/bin/env perl
use v5.36;

use DateTime;

# If there are 31 days in a month and the first day of the month is a Friday
# then there are 5 weekends in a month.

my $dt = DateTime->new(
    year  => 1900,
    month => 1,
    day   => 1,
);

while ( $dt->year() < 2020 ) {
    if ( $dt->month_length() == 31 && $dt->dow() == 5 ) {
        say $dt->year() . " " . $dt->month_name();
    }
    $dt->add( months => 1 );
}

