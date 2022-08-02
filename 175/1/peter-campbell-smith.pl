#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;
binmode(STDOUT, ':utf8');
use Time::Local qw(timelocal_posix);

my (@years, $year, $m, $month, $time, @t, $back, $y);

@years = (2022, 1753);

for $y (@years) {
		
	# loop over months Feb to next Jan, and move back to the Sunday preceding the 1st of each month
	say qq[\nYear $y:];

	$year = $y;
	for $m (1 .. 12) {
		
		# last time reset year and month
		$year ++ if $m == 12;
		$month = $m % 12;
		
		# unix time on 1st of month
		$time = timelocal_posix(0, 0, 12, 1, $month, $year - 1900);
		@t = localtime($time);
		
		# move back 7 days if Sunday, 6 if Saturday ...
		$back = $t[6] == 0 ? 7 : $t[6];
		$time -= $back * 86400;
		
		# and get the date
		@t = localtime($time);
		say sprintf('%04d-%02d-%02d', $t[5] + 1900, $t[4] + 1, $t[3]);
	}
}
