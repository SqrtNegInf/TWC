#!/usr/bin/env perl

use strict;
use warnings;

use DateTime;

my $y = $ARGV[0] || 2019;

for my $m ( 1 .. 12 ) {
   my $d = DateTime->last_day_of_month( year => $y, month => $m );

   my $days_diff = $d->dow - 5; #5 is Friday as day of week
   $days_diff += 7 if ($days_diff < 0);

   $d->subtract(days => $days_diff);

   print $d->ymd('/').$/;
}
