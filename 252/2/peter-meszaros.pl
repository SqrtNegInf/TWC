#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

my $cases = [
    5,
    3,
    1,
    6,
];

sub unique_sum_zero
{
    my $n = shift;

    my $arr = [];
    for my $i (1..($n/2)) {
        push @$arr, $i, -$i;
    }
    push @$arr, 0 if $n % 2;

    return $arr;
}

is(unique_sum_zero($cases->[0]), [1, -1, 2, -2, 0],     'Example 1');
is(unique_sum_zero($cases->[1]), [1, -1, 0],            'Example 2');
is(unique_sum_zero($cases->[2]), [0],                   'Example 3');
is(unique_sum_zero($cases->[3]), [1, -1, 2, -2, 3, -3], 'Example 4');
done_testing();

exit 0;

         
