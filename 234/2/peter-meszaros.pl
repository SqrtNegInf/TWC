#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Algorithm::Combinatorics qw/combinations/;

my $cases = [
	[4, 4, 2, 4, 3],
	[1, 1, 1, 1, 1],
	[4, 7, 1, 10, 7, 4, 1, 1],
];

sub unequal_triplets
{
	my $l = shift;

	my $cnt = 0;
	my $iter = combinations([0 .. $#$l], 3);
    while (my $c = $iter->next) {
		my @v = $l->@[@$c];
        ++$cnt if $v[0] != $v[1] and $v[1] != $v[2] and $v[0] != $v[2];
    }

	return $cnt;
}

is(unequal_triplets($cases->[0]),  3, '[4, 4, 2, 4, 3]');
is(unequal_triplets($cases->[1]),  0, '[1, 1, 1, 1, 1]');
is(unequal_triplets($cases->[2]), 28, '[4, 7, 1, 10, 7, 4, 1, 1]');
done_testing();
