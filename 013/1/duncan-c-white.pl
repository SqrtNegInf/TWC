#!/usr/bin/env perl
use v5.36;

use Date::Manip;

my $year = 2019;

#
# my $dayno = findlasstfriday( $year, $month );
#	Find the day number (1..31) of the last Friday in
#	month $month (1..12) in year $year.
#
sub findlasstfriday( $year, $month )
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
