#!/usr/bin/env perl
use v5.36;

for my $year ( 2000 .. 2999 ) {
	my $month = reverse substr $year, 2, 2;
	my $day   = reverse substr $year, 0, 2;
	next if $day < 1;
	next if $month < 1;
	next if $day > 31;
	next if $month > 12;
	say join '-', $month, $day, $year;
}
