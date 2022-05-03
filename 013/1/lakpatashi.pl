#!/usr/bin/env perl

use warnings;
use strict;

use Time::Local qw();

my $year = 2019;
for my $month (1..12){
	# 5 is friday
	printf "%.4d-%.2d-%.2d\n",$year,$month,last_dow_month($year,$month,5);
}

sub last_dow_month{
	# 0 <= month <= 11
	my ($year, $month, $dow) = @_;
	$year += int ($month/12);
	$month %= 12;

	# 1 day = 86400 sec
	my $time = Time::Local::timegm(0,0,0,1,$month,$year)-86400;
	my ($mday,$wday) = (gmtime($time))[3,6];
	return $mday - ($wday - $dow) % 7;
}



