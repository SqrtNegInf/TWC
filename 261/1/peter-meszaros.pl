#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[1, 2, 3, 45],
	[1, 12, 3],
	[1, 2, 3, 4],
	[236, 416, 336, 350],
];

sub element_digit_sum
{
	my $l = shift;

	my $elem_sum = 0;
	my $digi_sum = 0;

	for my $e (@$l) {
		$elem_sum += $e;
		$digi_sum += $_ for split('', $e);
	}

	return abs($elem_sum - $digi_sum);
}

is(element_digit_sum($cases->[0]),   36, 'Example 1');
is(element_digit_sum($cases->[1]),    9, 'Example 2');
is(element_digit_sum($cases->[2]),    0, 'Example 3');
is(element_digit_sum($cases->[3]), 1296, 'Example 4');
done_testing();

exit 0;
