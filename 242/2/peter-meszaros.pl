#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;

my $cases = [
	[[1, 1, 0], [0, 1, 1], [0, 0, 1]],
	[[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]],
];

sub flip_matrix
{
	my $m = shift;

	for my $row (@$m) {
		@$row = map { $_ ? 0 : 1 } reverse @$row;
	}

	return $m;
}

is_deeply(flip_matrix($cases->[0]),
		[[1, 0, 0], [0, 0, 1], [0, 1, 1]],
		'[[1, 1, 0], [1, 0, 1], [0, 0, 1]]');
is_deeply(flip_matrix($cases->[1]),
		[[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]],
		'[[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]');
done_testing();

exit 0;
