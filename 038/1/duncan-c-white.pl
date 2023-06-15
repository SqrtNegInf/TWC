#!/usr/bin/env perl
use v5.36;

use Date::Manip;

my $date = shift // "2230120";

sub validate( $date )
{
	# must be 7 digits number
	return undef unless $date =~ /^(\d)(\d\d)(\d\d)(\d\d)$/;
	my( $first, $y, $m, $d ) = ( $1, $2, $3, $4 );

	# where the first number can only be 1 or 2.
	return undef unless $first eq '1' || $first eq '2';

	# The second and third digits can be anything 0-9.
	# If 1st digit is 1, then prepend 20 otherwise 19 to the year
	$y = ($first eq '1' ? 20 : 19).$y;

	# The fourth and fifth digits corresponds to the month i.e. 01-12.
	return undef unless $m >= 1 && $m <= 12;

	my $ndays = Date_DaysInMonth( $m, $y );
	#say "debug: y=$y, m=$m, ndays=$ndays";

	# The last 2 digits respresents the days in the month i.e. 01-31.
	return undef unless $d >= 1 && $d <= $ndays;

	# Valid: convert into human readable format date.
	return "$y-$m-$d";
}


my $isodate = validate( $date );
if( defined $isodate )
{
	say "$date: valid $isodate";
} else
{
	say "$date: invalid";
}
