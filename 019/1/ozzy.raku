#!/usr/bin/env raku

for 1900..2019 -> $year {
    for 1..12 -> $month {
        my $d = Date.new($year,$month,1);
        say "$d.year()/$d.month()" if $d.day-of-week == 5 && $d.days-in-month == 31;
    }
}
