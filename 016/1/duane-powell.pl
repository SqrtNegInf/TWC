#!/usr/bin/env perl
use v5.36;

my $verbose = shift;

my $pie = 1;
my $guest = 0;
my $slice = 0;
my $biggest_slice = 0;
for my $s (1..100) {
	my $one_percent = $pie/100;
	$slice = $s * $one_percent;
	$pie -= $slice;
	if ($slice > $biggest_slice) {
		$biggest_slice = $slice;
		$guest = $s;
	}
	say "$s $slice $pie" if ($verbose);
}

say "Guest number $guest got the largest slice of pie";
