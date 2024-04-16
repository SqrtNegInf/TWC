#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [[[0, 1, 2, 3, 4], [0, 1, 2, 2, 1]], [0, 4, 1, 3, 2], 'Example 1'],
    [[[1, 2, 3, 4, 0], [0, 1, 2, 3, 0]], [0, 1, 2, 3, 4], 'Example 2'],
    [[[1],             [0]],             [1],             'Example 3'],
];

sub target_array
{
    my $sources = $_[0]->[0];
    my $indices = $_[0]->[1];

    my @res;
    splice @res, $indices->[$_], 0, $sources->[$_] for 0..$#$sources;

    return \@res;
}

for (@$cases) {
    is(target_array($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

