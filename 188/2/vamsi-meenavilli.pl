#!/usr/bin/env perl
use v5.36;
use Test::More;

is total_zero(5, 4), 5, 'example 1';
is total_zero(4, 6), 3, 'Example 2';
is total_zero(2, 5), 4, 'Example 3';
is total_zero(3, 1), 3, 'Example 4';
is total_zero(7, 4), 5, 'Example 5';

done_testing();

sub total_zero {
    my ($x, $y) = @_;

    my $operations_count = 0;

    while ($x > 0 && $y > 0) {
        ($x >= $y) ? ($x -= $y) : ($y -= $x);
        $operations_count++;
    }


    return $operations_count;
}
