#!/usr/bin/env perl
use warnings;
use strict;
use feature 'say';
use DateTime;
use DateTime::Duration;

my $year_end = shift || 2100; # cut short, annoyingly slow

my $dt  = DateTime->new('year' => 2000, 'month' => 1, 'day' => 1);
my $day = DateTime::Duration->new('days' => 1);

until ($dt->year == $year_end) {
	my @pali = split('',$dt->mdy);
	# @pali is a 10 element array MM-DD-YYYY
	say $dt->mdy() if ($pali[0] == $pali[9] and $pali[1] == $pali[8] and $pali[3] == $pali[7] and $pali[4] == $pali[6]);
	$dt->add( $day );
}
