#!/usr/bin/env raku

for 2019..2100 -> $year {
    my $date = Date.new($year, 12, 25);
    if ($date.day-of-week == 7) {
        say "12/25/$year"
    }
}
