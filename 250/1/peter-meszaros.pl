#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

my $cases = [
    [0, 1, 2],
    [4, 3, 2, 1],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
];

sub smallest_index
{
    my $l = shift;

    for my $i (0..$#$l) {
        return $i if ($i % 10) == $l->[$i];
    }

	return -1;
}

is(smallest_index($cases->[0]),  0, 'Example 1');
is(smallest_index($cases->[1]),  2, 'Example 2');
is(smallest_index($cases->[2]), -1, 'Example 3');
done_testing();

exit 0;
