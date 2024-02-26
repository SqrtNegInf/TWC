#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;

my $cases = [
	[5, 2, 1, 6],
	[1, 2, 0, 3],
	[0, 1],
	[9, 4, 9, 2],
];

sub smaller_than_current
{
	my $l = shift;

	my @res;
	for my $i (0..$#$l) {
		my $c = 0;
		for my $j (0..$#$l) {
			if ($j == $i) {
				next;
			} elsif ($l->[$j] < $l->[$i]) {
				++$c;
			}
		}
		$res[$i] = $c;
	}

	return \@res;;
}

is(smaller_than_current($cases->[0]), [2, 1, 0, 3], 'Example 1');
is(smaller_than_current($cases->[1]), [1, 2, 0, 3], 'Example 2');
is(smaller_than_current($cases->[2]), [0, 1],       'Example 3');
is(smaller_than_current($cases->[3]), [2, 1, 2, 0], 'Example 4');
done_testing();

exit 0;
