#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
    [6, 12, 25, 1],
    [10, 7, 31, 5, 2, 2],
    [1, 2, 10],
];

sub concatenation_value
{
    my $l = shift;

    my $v = 0;
    for my $i (0..($#$l/2)) {
        my $j = $#$l - $i;
        $v += ($i == $j) ? $l->[$i] : ($l->[$i] . $l->[$j]);
    }

    return $v;
}

is(concatenation_value($cases->[0]), 1286, 'Example 1');
is(concatenation_value($cases->[1]),  489, 'Example 2');
is(concatenation_value($cases->[2]),  112, 'Example 3');
done_testing();
