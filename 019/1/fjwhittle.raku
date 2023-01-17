#!/usr/bin/env raku # do-not-check

# segfaults on grep (GH5160)
BEGIN die 'not ok - disabled: does not work with release 2022.12';

my enum Month «:1January February March April May June July August September October November December»;

(Date.new('1900-01-01'), *.later(:1month) ... Date.new('2019-12-01')).\
  grep({.day-of-week == 5 and .days-in-month == 31}).\
  map({"{Month(.month)} {.year}"})».say;
