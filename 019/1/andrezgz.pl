#!/usr/bin/env perl
use v5.36;

use DateTime;

my $y = $ARGV[0] || 1900;

# 5 weekends in a month are only possible when
# the last day of the month is Sunday 31st

do {
    # loop only through months with 31 days
    for my $m ( 1, 3, 5, 7, 8, 10, 12 ) {
        my $d = DateTime->last_day_of_month( year => $y, month => $m );
        print $d->month_name.' '.$y."\n" if ( $d->dow == 7); #7 is Sunday as day of week
    }
} until (++$y > 2019);
