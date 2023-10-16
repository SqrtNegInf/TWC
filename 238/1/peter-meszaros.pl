#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $cases = [
	[1, 2, 3, 4, 5],
	[1, 1, 1, 1, 1],
	[0, -1, 1, 2],
];

sub running_sum
{
	my $l = shift;

	my @ret;
	my $sum = 0;
	for my $v (@$l) {
		$sum += $v;
		push @ret, $sum;
	}

    return \@ret;
}

is_deeply(running_sum($cases->[0]), [1, 3, 6, 10, 15], '[1, 2, 3, 4, 5]');
is_deeply(running_sum($cases->[1]), [1, 2, 3, 4, 5],   '[1, 1, 1, 1, 1]');
is_deeply(running_sum($cases->[2]), [0, -1, 0, 2],     '[0, -1, 1, 2]');
done_testing();

exit 0;


