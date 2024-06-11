#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	['hello', 13, 'Example 1'],
	['perl',  30, 'Example 2'],
	['raku',  37, 'Example 3'],
	['r',      0, 'Example 4'],
	['',       0, 'Example 5'],
];

sub string_score
{
	my $s = shift;

	my @s = split(//, $s);

	my $sum = 0;
	for my $i (1..$#s) {
		$sum += abs(ord($s[$i-1]) - ord($s[$i]));
	}

    return $sum;
}

for (@$cases) {
    is(string_score($_->[0]), $_->[1], $_->[2]);
}
done_testing();
