#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand => 1;
use Data::Dumper;

my $cases = [
	[["abcdefghijklmnopqrstuvwxyz",
		 [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]],
     [3, 60]],
	[["bbbcccdddaaa",
		 [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]],
     [2, 4]],
];

sub line_counts
{
	my $text = $_[0]->[0];
	my $widths = $_[0]->[1];

	my $length = 100;
	my $lines = 0;
	my $len = 0;
	for my $c (split '', $text) {
		my $w = $widths->[ord($c) - ord('a')];
		$len += $w;
		if ($len > 100) {
			++$lines;
			$len = $w;
		}
	}
	++$lines if $len > 0;
	return [$lines, $len];
}

for (@$cases) {
    is(line_counts($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

