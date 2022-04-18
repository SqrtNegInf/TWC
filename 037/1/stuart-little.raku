#!/usr/bin/env raku

sub nr_weekdays(Int $year, Int $month where 1 <= * <= 12) {
    ((my $date=Date.new($year,$month,1))..$date.last-date-in-month).grep({ $_.day-of-week == (1..5).any }).elems
}

my $year=(@*ARGS) ?? (@*ARGS[0].Int) !! 2019;

say $year;
for (1..12).map({ $_ => nr_weekdays($year,$_) }) {.say}
