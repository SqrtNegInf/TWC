#!/usr/bin/env raku

use Test;

my @month-abbrv=<Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec>;


sub weekdays-in-month(DateTime $date) {
    my $count=0;
    for ^$date.days-in-month -> $day {
        $count++ unless $date.later(days => $day).day-of-week >= 6;
    }
    return $count;
}

for 1..12 -> $month {
    say sprintf "%s: %02d days", @month-abbrv[$month-1],  weekdays-in-month(DateTime.new(year => 2019, month=> $month, day => 1 ));
}
