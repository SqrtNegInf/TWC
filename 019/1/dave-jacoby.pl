#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature qw{ postderef say signatures state switch };
no warnings
    qw{ experimental::postderef experimental::smartmatch experimental::signatures };

use DateTime;

# The Challenge

#       Write a script to display months from the year 1900 to 2019 
#       where you find 5 weekends i.e. 5 Friday, 5 Saturday and 5 Sunday.

# Let's look at an example of such a month.

#    March 2019
#
#  M   T   W   T   F   S   S 
#                  1   2   3 
#  4   5   6   7   8   9  10 
# 11  12  13  14  15  16  17 
# 18  19  20  21  22  23  24 
# 25  26  27  28  29  30  31 

# A four-weekend month fits in 28 days, so that could be any month,
# but as we see here, we need 3 more days, so we need a 31 day month,
# and it only works if the month starts on Friday.

# 30 days have September (9)
# April (4), June (6) and November (11)
# And February (2) is right out

my @months = (1, 3, 5, 7, 8, 10, 12);

# We only need one DateTime object.
# We'll set the month, day and year as needed

my $date = DateTime->now();
$date->set_day(1);
for my $year ( 1900 .. 2019 ) {
    $date->set_year($year);
    for my $month ( @months ) {
        $date->set_month($month);
        say $date->ymd if 5 == $date->day_of_week;
    }
}
