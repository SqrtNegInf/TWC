#!/usr/bin/env perl
use v5.36;

use DateTime;
use DateTime::Duration;

my $year = 2019;

use constant {
        SATURDAY => 6,
        SUNDAY   => 7,
};

my $dt = DateTime->new('year' => $year, 'month' => 1, 'day' => 1);
my $day = DateTime::Duration->new('days' => 1);
my $month = $dt->month;
my $weekday_count = 0;
do {
	print $dt->month_abbr;

	do {
		$weekday_count++ if ($dt->day_of_week != SUNDAY and $dt->day_of_week != SATURDAY);
		$dt->add( $day );
	} until ($dt->month != $month);

	say ": $weekday_count";

	$month = $dt->month;
	$weekday_count = 0;

} until ($dt->year != $year);
