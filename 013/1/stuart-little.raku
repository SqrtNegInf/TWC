#!/usr/bin/env raku

for (1..12).map({ ((my $date=Date.new(2022,$_,1))..$date.last-date-in-month).reverse.first(*.day-of-week == 5) }) {.say}
