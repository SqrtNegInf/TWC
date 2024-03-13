#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[10, 1, 111, 24, 1000],
	[111, 1, 11111],
	[2, 8, 1024, 256],
];

sub count_even_digits_number
{
	my $ints = shift;

	return scalar grep { not split('') % 2 } @$ints;
}

is(count_even_digits_number($cases->[0]), 3, 'Example 1');
is(count_even_digits_number($cases->[1]), 0, 'Example 2');
is(count_even_digits_number($cases->[2]), 1, 'Example 3');
done_testing();
