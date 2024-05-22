#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	[[2, 1, 3, 4, 5], [2, 3, 4, 5, 1]],
	[[3, 2, 4],       [3, 4, 2]],
	[[5, 4, 3 ,8],    [5, 3, 4, 8]],
];

sub distribute_elements
{
    my $l = shift;

    my (@arr1, @arr2);
    $arr1[0] = shift @$l;
    $arr2[0] = shift @$l;

    for my $e (@$l) {
        if ($arr1[-1] > $arr2[-1]) {
            push @arr1, $e;
        } else {
            push @arr2, $e;
        }
    }

    return [@arr1, @arr2];
}

for (@$cases) {
    is(distribute_elements($_->[0]), $_->[1], $_->[2]);
}
done_testing();
