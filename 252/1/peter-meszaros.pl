#!/usr/bin/env perl

my $cases = [
    [1, 2, 3, 4],
    [2, 7, 1, 19, 18, 3],
];

sub special_numbers
{
    my $l = shift;

    my $len = @$l;
    my $sum = 0;
    for my $i (1..$len) {
        unless ($len % $i) {
            $sum += $l->[$i-1]**2;
        }
    }
    return $sum;
}

use Test::More;
is(special_numbers($cases->[0]), 21, 'Example 1');
is(special_numbers($cases->[1]), 63, 'Example 2');
done_testing();
