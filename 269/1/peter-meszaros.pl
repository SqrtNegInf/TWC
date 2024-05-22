#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
    [[1, 2, 3, 4, 5], 1],
    [[2, 3, 8, 16],   1],
    [[1, 2, 5, 7, 9], 0],
];

sub bitwise_or
{
    my $l = shift;

    my $c;
    for my $n (@$l) {
        unless ($n % 2) {
            return 1 if $c;
            ++$c;
        }
    }
    return 0;
}

for (@$cases) {
    is(bitwise_or($_->[0]), $_->[1], $_->[2]);
}

done_testing();
