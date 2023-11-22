#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
	[2, 5, 9],
	[7, 7, 7, 7, 7, 7, 7],
];

sub floor_sum
{
	my $l = shift;

	my $sum = 0;
	for my $i (@$l) {
		for my $j (@$l) {
			$sum += int($i / $j);
		}
	}

    return $sum;
}

is(floor_sum($cases->[0]), 10, '[2, 5, 9]');
is(floor_sum($cases->[1]), 49, '[7, 7, 7, 7, 7, 7, 7]');
done_testing();

exit 0;
