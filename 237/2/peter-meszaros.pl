#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;
use Math::Combinatorics qw/permute/;

my $cases = [
	[1, 3, 5, 2, 1, 3, 1],
	[1, 2, 3, 4],
];

sub maximise_greatness
{
	my $l = shift;

	my $maxperm = 0;

	for my $p (permute(@$l)) {
		my $perm = 0;
		for (my $i=0; $i < @$p; ++$i) {
			++$perm if $p->[$i] > $l->[$i];
		}
		$maxperm = $perm if $perm > $maxperm;
	}

	return $maxperm;
}

is(maximise_greatness($cases->[0]), 4, '[1, 3, 5, 2, 1, 3, 1]');
is(maximise_greatness($cases->[1]), 3, '[1, 2, 3, 4]');
done_testing();

exit 0;
