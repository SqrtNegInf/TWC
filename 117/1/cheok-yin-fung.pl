#!/usr/bin/env perl
use v5.36;

while(<DATA>) {/^\s*(\d+)/; $arr{$1} = 1;} for (1..15) {print ($_, "\n") unless $arr{$_};}

__END__
11, Line Eleven
1, Line one
9, Line Nine
13, Line Thirteen
2, Line two
6, Line Six
8, Line Eight
10, Line Ten
7, Line Seven
4, Line Four
14, Line Fourteen
3, Line three
15, Line Fifteen
5, Line Five
