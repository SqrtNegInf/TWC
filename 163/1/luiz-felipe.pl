#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

# answer differs from others

my @numbers = <1 2 3 10>;

say "the sum of bitwise of these numbers are ", sum_bitwise(@numbers);

sub sum_bitwise {
	my (@numbers, $sum);

	@numbers = @_;

	$sum = 0;
	while (scalar @numbers != 0) {
		my ($first);

		$first = $numbers[0];
		for my $i (1..$#numbers) {
			$sum += $first & $numbers[$i];
		}

		shift @numbers;
	}

	return $sum;
}
