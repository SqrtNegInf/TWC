#!/usr/bin/env raku

for 2019 .. 2100 -> $year {
    if (Date.new($year, 12, 25).day-of-week == 7) {
        $year.say;
    }
}
