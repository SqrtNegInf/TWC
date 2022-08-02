#!/usr/bin/env raku

sub MAIN (
    Int $year = 2022
) {
    for 1..12 -> $month {
        my $lastDate = Date.new($year, $month, 1).last-date-in-month;
        say $lastDate - $lastDate.day-of-week % 7;
    }
}
