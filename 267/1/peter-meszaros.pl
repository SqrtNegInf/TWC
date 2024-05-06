#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand => 1;
use Data::Dumper;

my $cases = [
	[[-1, -2, -3, -4, 3, 2, 1], 1],
	[[1, 2, 0, -2, -1],         0],
	[[-1, -1, 1, -1, 2],       -1],
];

sub product_sign
{
	my $l = shift;

	my $res = 1;

	$res *= $_ for @$l;

	return $res <=> 0;
}

for (@$cases) {
    is(product_sign($_->[0]), $_->[1], $_->[2]);
}
done_testing();
