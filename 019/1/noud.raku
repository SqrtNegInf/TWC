#!/usr/bin/env raku

my %months = <January February March April May June July August September
              October November December>.pairs;

for 1900 .. 2019 -> $year {
    for 1 .. 12 -> $month {
        my $date = Date.new($year, $month, 1);
        # A month can only have 5 Fridays, Saturdays, and Sundays if the month
        # contains of 31 days, and the first day of the month is a Friday.
        if ($date.days-in-month == 31 and $date.day-of-week == 5) {
            say "{$date.year} %months{$month - 1}";
        }
    }
}
