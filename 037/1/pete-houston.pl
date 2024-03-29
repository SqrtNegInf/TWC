#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $year = 2019; #get_year ();

for my $mon (1..12) {
    print weekdays($year, $mon) . "\n";
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

sub weekdays {
    my ($year, $mon) = @_;
    my $wdaytot = 20;
    my $dt = Time::Piece->strptime ("$year/$mon/28", '%Y/%m/%d');
    while ($dt->month_last_day > $dt->mday) {
        $dt += ONE_DAY;
        $wdaytot++ if $dt->wday > 1 && $dt->wday < 7;
    }
    return $dt->monname . " $wdaytot";
}
