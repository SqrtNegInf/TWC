#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Data::Dumper;
use Date::Simple ('ymd');


my $y = 2022;

foreach my $m (1..12)
{
	my $sunday;
	for( my $d = ymd($y, $m, 1); $d->month == $m; $d++ )
	{
		$sunday = $d if $d->day_of_week() == 0;
	}
	say $sunday;
}
