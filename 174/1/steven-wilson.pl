#!/usr/bin/env perl
use v5.36;

my $number = 0;
my @disarium_numbers;

while ( scalar @disarium_numbers < 18) {
	if (disarium($number)) {
		push @disarium_numbers, $number;
	}
	$number++;
}

say join " ", @disarium_numbers;

sub disarium {
	my $number = shift;
	my @numbers = split //, $number;
	my $sum = 0;
	my $i = 1;
	for ($i .. scalar @numbers) {
		$sum += ($numbers[$_ - 1] ** $_);
	}
	return $sum == $number;
}
