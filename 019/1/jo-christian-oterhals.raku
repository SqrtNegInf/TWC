#!/usr/bin/env raku

say join "\n", grep *.day-of-week == 5, map { Date.new: |$_, 1 }, do 1900..2019 X 1,3,5,7,8,10,12;
