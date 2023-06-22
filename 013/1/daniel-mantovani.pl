#!/usr/bin/env perl
use v5.36;

use Time::Local;
my $year   = 2019;
my $epoch  = timegm( 0, 0, 12, 1, 1, $year );    # February 1st 12 noon epoch
my $oneday = 24 * 3600;                          # one day in seconds

# Now we start calculating month by month, incrementing
# $epoch by days or weeks to find each month first Friday.
#
# We are using only two values form the array returned by
# Perl standard function gmtime:
# (gmtime(<epoch>))[6] gives us the "week day" (5 for Friday), and
# (gmtime(<epoch>))[3] gives us the "month day" ( could be from 1
# to 31 depending on the actual month),

my $month = 1;

while ( $month <= 12 ) {
    if ( ( gmtime($epoch) )[6] != 5 ) {

        # not a Friday, try again tomorrow
        $epoch += $oneday;
    }
    elsif ( ( gmtime($epoch) )[3] > 7 ) {

        # not on first week, try again on next week
        $epoch += 7 * $oneday;
    }
    else {

        # here $epoch corresponds to the first Friday of the
        # following month to $month. So we already have
        # the year and the month, and only need to calculate
        # exact "month day" of last week's Friday
        printf "%4u/%02u/%2u\n", $year, $month++,
          ( gmtime( $epoch - 7 * $oneday ) )[3];

        # and we don't really need to check next 3 weeks
        $epoch += 28 * $oneday;
    }
}
