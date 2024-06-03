#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;
use List::Util qw/sum0/;

my $cases = [
	[[[0, 1],
	  [1, 0],
	 ], 1],
	[[[0, 0, 0],
	  [1, 0, 1],
	 ], 2],
	[[[0, 0],
	  [1, 1],
	  [0, 0],
	 ], 2],
	[[[0, 0],
	  [0, 0],
	  [0, 0],
	 ], 0],
];

sub maximum_ones
{
	my $m = shift;

	my $max_row = 0;
	my $max_val = 0;
	for my $row (0 .. $#$m) {
		my $sum = sum0($m->[$row]->@*);
		if ($sum > $max_val) {
			$max_row = $row+1;
			$max_val = $sum;
		}
	}
    return $max_row;
}

for (@$cases) {
    is(maximum_ones($_->[0]), $_->[1], $_->[2]);
}

done_testing();

exit 0;
