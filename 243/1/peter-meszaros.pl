#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;

my $cases = [
	[1, 3, 2, 3, 1],
	[2, 4, 3, 5, 1],
];

sub reverse_pairs
{
	my $l = shift;

	my $cnt = 0;
	for my $i (0..($#$l-1)) {
		for my $j (($i+1)..$#$l) {
			++$cnt if $l->[$i] > (2 * $l->[$j]);
		}
	}
    return $cnt;
}

is(reverse_pairs($cases->[0]), 2, '[1, 3, 2, 3, 1]');
is(reverse_pairs($cases->[1]), 3, '[2, 4, 3, 5, 1]');

done_testing();
