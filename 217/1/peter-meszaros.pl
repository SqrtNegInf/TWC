#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

my $cases = [
	[[3, 1, 2], [5, 2, 4], [0, 1, 3]],
	[[2, 1], [4, 5]],
	[[1, 0, 3], [0, 0, 0], [1, 2, 1]],
];

sub sorted_matrix
{
	my $m = shift;
	my $n = shift;

    my @l;
    push @l, @$_ for @$m;
	@l = sort {$a <=> $b} @l;

    return $l[$n-1];
}

is(sorted_matrix($cases->[0], 3), 1, '[[3, 1, 2], [5, 2, 4], [0, 1, 3]]');
is(sorted_matrix($cases->[1], 3), 4, '[[2, 1], [4, 5]]');
is(sorted_matrix($cases->[2], 3), 0, '[[1, 0, 3], [0, 0, 0], [1, 2, 1]]');
done_testing();

exit 0;
