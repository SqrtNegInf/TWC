#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);
use Date::Manip;
use Data::Dumper;

my $startyear = shift // 1900;
my $endyear = shift // 2019;

#
# my $n = threedayweekends( $year, $month );
#	Find how many three day weekends (Friday, Saturday and Monday)
#	there are in month $month (1..12) in year $year.
#
sub threedayweekends( $year, $month )
{
	my $nfri = 0;
	my $nsat = 0;
	my $nsun = 0;
	my $ndays = Date_DaysInMonth( $month,$year );
	foreach my $dayno (1..$ndays)
	{
		my $day = Date_DayOfWeek( $month, $dayno, $year );
		$nfri++ if $day == 5;
		$nsat++ if $day == 6;
		$nsun++ if $day == 7;
	}
	return min( $nfri, $nsat, $nsun );
}


foreach my $y ($startyear..$endyear)
{
	foreach my $m (1..12)
	{
		my $n = threedayweekends( $y, $m );
		printf "%02d/$y $n three day weekends\n", $m if $n==5;
	}
}
