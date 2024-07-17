#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;
use List::Util qw/min uniqint/;
use Algorithm::Combinatorics qw/combinations/;

my $cases = [
    [[1, 2, 3, 4, 5], 4],
    [[5, 7, 1, 7],    1],
];

sub strong_pair
{
    my $ints = shift;

    my $cnt = 0;
    my $iter = combinations([uniqint @$ints], 2);
    while (my $c = $iter->next) {
        my $abs = abs($c->[0] - $c->[1]);
        my $min = min($c->[0], $c->[1]);
        $cnt++ if 0 < $abs && $abs < $min;
    }

    return $cnt;
}

for (@$cases) {
    is(strong_pair($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

