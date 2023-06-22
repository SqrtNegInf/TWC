#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $year = 2019;

for my $mon (1..12) {
    print last_friday($year, $mon) . "\n";
}

sub get_year {
    my $year = shift @ARGV;
    if (defined $year) {
        if ($year =~ /^(\d{4})$/) {
            if ($year > 1969 && $year < 2039) {
                return $1;
            } else {
                warn "Year $year outside acceptable range 1970-2038\n";
            }
        } else {
            warn "The supplied year ($year) is invalid. Using current year\n";
        }
    } else {
        warn "No year supplied. Using current year\n";
    }
    return localtime(time)->year;
}

sub last_friday {
    my ($year, $mon) = @_;
    my $first = sprintf "%i-%2.2i-01", $year, $mon;
    my $day = Time::Piece->strptime ($first, "%Y-%m-%d");
    $day += ONE_DAY * ($day->month_last_day - 1);

  while ($day->day_of_week != 5) { $day -= ONE_DAY }
    return $day->ymd;
}

