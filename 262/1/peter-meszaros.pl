#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [[-3, 1, 2, -1, 3, -2, 4], 4, 'Example 1'],
    [[-1, -2, -3, 1],          3, 'Example 2'],
    [[1,2],                    2, 'Example 3'],
];

sub max_positive_negative
{
    my $l = shift;

    my $pos = 0;
    my $neg = 0;
    for my $i (@$l) {
        if ($i > 0) {
            ++$pos;
        } elsif ($i < 0) {
            ++$neg;
        }
    }
	return $pos > $neg ? $pos : $neg;
}

for (@$cases) {
    is(max_positive_negative($_->[0]), $_->[1], $_->[2]);
}

done_testing();
