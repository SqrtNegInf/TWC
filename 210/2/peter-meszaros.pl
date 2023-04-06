#!/usr/bin/env perl

use v5.36;
use strict;
use warnings;
use Test::More;

my $cases = [
	[2, 3, -1],
	[3, 2, -4],
	[1, -1],
];

sub collision
{
    my @a = (shift)->@*;
	my $coll;
	do {
		$coll = 0;
		for my $i (0 .. ($#a-1)) {
			my ($x, $y) = ($a[$i], $a[$i+1]);
			my $xa = abs($x);
			my $ya = abs($y);
			if (($x < 0 and $y > 0) or ($x > 0 and $y < 0)) { # collision
				++$coll;
				if ($xa == $ya) {
					splice(@a, $i, 2);
				} elsif  ($xa < $ya) {
					splice(@a, $i, 1);
				} elsif  ($xa > $ya) {
					splice(@a, $i+1, 1);
				}
			}
		}
	} while $coll;
	return '(' . join(', ', @a) . ')';
}

is(collision($cases->[0]), '(2, 3)', '[2, 3, -1]');
is(collision($cases->[1]), '(-4)',   '[3, 2, -4]');
is(collision($cases->[2]), '()',     '[1, -1]');
done_testing();

