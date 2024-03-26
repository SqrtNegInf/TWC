#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[[5, 3, 6, 1, 12], 3],
	[[1, 2, 4, 3],     1],
	[[5, 6, 7],        2],
];

sub multiply_by_two
{
	my ($l, $s) = $_[0]->@*;

	START:
	for my $i (@$l) {
		if ($i == $s) {
			$s *= 2;
 			goto START;
		}
	}
	return $s;
}

is(multiply_by_two($cases->[0]), 24, 'Example 1');
is(multiply_by_two($cases->[1]),  8, 'Example 2');
is(multiply_by_two($cases->[2]),  2, 'Example 3');
done_testing();
