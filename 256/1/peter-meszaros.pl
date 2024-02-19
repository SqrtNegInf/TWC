#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;

my $cases = [
	["ab", "de", "ed", "bc"],
	["aa", "ba", "cd", "ed"],
	["uv", "qp", "st", "vu", "mn", "pq"],
];

sub maximum_pairs
{
	my $pairs = shift;

	my %h = map { $_, 1 } @$pairs;
    my $numpairs = 0;
    for my $e (@$pairs) {
        delete $h{$e};
        ++$numpairs if $h{reverse $e};
	}
	return $numpairs;
}

is(maximum_pairs($cases->[0]), 1, 'Example 1');
is(maximum_pairs($cases->[1]), 0, 'Example 2');
is(maximum_pairs($cases->[2]), 2, 'Example 3');
done_testing();

exit 0;
