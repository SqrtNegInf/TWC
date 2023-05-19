#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Date::Simple (':all');

my $debug=0;
#die "Usage: work-days Year\n" unless
#	GetOptions( "debug"=>\$debug ) && @ARGV==1;

my $year = 2022;

my $weekdays = 0;
for( my $day = date("$year-01-01"); $day->year == $year; $day++ )
{
	my $dow = $day->day_of_week;
	$weekdays++ if $dow >= 1 && $dow <= 5;
}
say $weekdays;
