#!/usr/bin/env raku

# segfaults with grep/excess data bug
BEGIN die 'not ok - disabled: does not work with blead as of 2022-12-18';

my enum Month «:1January February March April May June July August September October November December»;

(Date.new('1900-01-01'), *.later(:1month) ... Date.new('2019-12-01')).\
  grep({.day-of-week == 5 and .days-in-month == 31}).\
  map({"{Month(.month)} {.year}"})».say;
