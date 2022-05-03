#!/usr/bin/env perl

# Challenge 1: "Write a script to print the date of last Friday of every
# month of a given year. For example, if the given year is 2019 then it
# should print the following:

use strict;
use warnings;
use Function::Parameters;
use Date::Manip;
#use Data::Dumper;

my $year = 2019;

#
# my $dayno = findlasstfriday( $year, $month );
#	Find the day number (1..31) of the last Friday in
#	month $month (1..12) in year $year.
#
fun findlasstfriday( $year, $month )
{
	my $ndays = Date_DaysInMonth $month,$year;
	my $lastfriday = -1;
	foreach my $dayno (21..$ndays)
	{
		my $day = Date_DayOfWeek( $month, $dayno, $year );
		$lastfriday = $dayno if $day == 5;
	}
	return $lastfriday;
}


foreach my $m (1..12)
{
	my $dayno = findlasstfriday( $year, $m );
	printf "$year/%02d/$dayno\n", $m;
}
