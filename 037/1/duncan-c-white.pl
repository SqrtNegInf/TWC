#!/usr/bin/env perl
use v5.36;

use Date::Manip;

my @month = qw(X Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);


#
# my $n = countweekdays( $y, $m );
#	Find how many week days (Monday..Friday) there are in month $month
#	(1..12) in year $y.
#
sub countweekdays( $year, $month )
{
	my $n = 0;
	my $ndays = Date_DaysInMonth( $month,$year );
	foreach my $dayno (1..$ndays)
	{
		my $day = Date_DayOfWeek( $month, $dayno, $year );
		$n++ if $day < 6;
	}
	return $n;
}


my $y = shift // 2019;
foreach my $m (1..12)
{
	my $n = countweekdays( $y, $m );
	print $month[$m], " $y: $n weekdays\n";
}
