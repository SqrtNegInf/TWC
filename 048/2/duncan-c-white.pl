#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Date::Manip;

my $format    = "US";
my %valid     = map { $_ => 1 } qw(UK ISO US);
my $result    = GetOptions( "format=s" => \$format );
die "Usage: palindromicdates [--format=UK|ISO|US] [STARYEAR [ENDYEAR]]\n"
	if $result && @ARGV>2;
my $startyear = shift // 2000;
my $endyear   = shift // 2999;
$format       = uc($format);
die "bad format $format (should be UK|ISO|US)\n" unless $valid{$format};

my @palindromes = palindromicdates( $startyear, $endyear, $format );
say join("\n",@palindromes);

#
# my $ispal = palindromic( $s );
#	Returns 1 iff the string $s is palindromic.
#
sub palindromic( $s )
{
	return $s eq reverse($s) ? 1 : 0;
}


#
# my $datestr = formdate( $day, $month, $year, $format );
#	Form the date string for day no $day (1..ndaysinmonth),
#	month $month (1..12) and year $year, in the given format $format,
#	which is either UK (ddmmyyyy) or US (mmddyyyy) or ISO (yyymmdd).
#
sub formdate( $day, $month, $year, $format )
{
	my $y = sprintf( "%04d", $year );
	my $m = sprintf( "%02d", $month );
	my $d = sprintf( "%02d", $day );
	return "$d$m$y" if $format eq "UK";
	return "$m$d$y" if $format eq "US";
	return "$y$m$d" if $format eq "ISO";
	die "formdate: bad format $format, should be UK|US|ISO";
}


#
# my @p = palindromicdates( $startyear, $endyear, $format );
#	Find and return all palindromic dates in any year between $startyear
#	and $endyear in date format $format (UK or US or ISO).
#
sub palindromicdates( $startyear, $endyear, $format )
{
	my @palindrome;
	foreach my $year ($startyear..$endyear)
	{
		foreach my $month (1..12)
		{
			my $ndays = Date_DaysInMonth($month,$year);
			foreach my $day (1..$ndays)
			{
				my $date = formdate(
					$day, $month, $year, $format );
				push @palindrome, $date if palindromic($date);
			}
		}
	}
	return @palindrome;
}
