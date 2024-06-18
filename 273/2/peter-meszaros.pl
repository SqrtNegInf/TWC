#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	['aabb', 1],
	['abab', 0],
	['aaa',  0],
	['bbb',  1],
];

sub b_after_a
{
	my $str = shift;

	return $str =~ m/^[^b]*b[^a]+$/ ? 1 : 0;
}

for (@$cases) {
    is(b_after_a($_->[0]), $_->[1], $_->[2]);
}
done_testing();
