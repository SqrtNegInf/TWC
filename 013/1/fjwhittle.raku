#!/usr/bin/env raku

my enum Weekdays «:Monday(1) Tuesday Wednesday Thursday Friday Saturday Sunday»;

#| Print out the date of the last Friday of every month in a given year
unit sub MAIN (
  UInt $year = 2022
);

sprintf('%4d/%02d/%02d', .year, .month, .day).put
  for (Date.new(:$year:1month:25day)..Date.new(:$year:12month:31day))
    .grep: {
      .day-of-week == Friday and .day > .days-in-month - 7
    }
