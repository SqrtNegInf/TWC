#!/usr/bin/env perl
use v5.36;

use Date::Manip::Recur;

my $dates = &last_sunday(2022);

foreach my $date (@$dates) {
	print $date->printf("%Y-%m-%d"),"\n";
}

sub last_sunday {
	my ($year)=@_;
	my $recur = Date::Manip::Recur->new();

	$recur -> parse("last Sunday of every month in $year");
	my @dates=$recur->dates();
		
	return \@dates;
}

1;
