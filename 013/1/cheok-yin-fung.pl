#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $year = $ARGV[0] || 2019;
die "Sorry, it's too long ago." if $year < 1900;
print "Year: $year\n\n";

for my $month (1..12) { 
    my $first_day_of_nmonth = ($month != 12) ? 
         Time::Piece->strptime($year."-".($month+1)."-01", "%Y-%m-%d")
       : Time::Piece->strptime(($year+1)."-01-01", "%Y-%m-%d");

    my $target_day = ($first_day_of_nmonth -= ONE_DAY);
    while ($target_day->day_of_week != 5) {
        $target_day -= ONE_DAY;
    }
    print($target_day->strftime("%Y-%m-%d"), "\n");
}
