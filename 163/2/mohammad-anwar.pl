#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

is summations([1, 2, 3, 4, 5]), 42, 'Example 1';
is summations([1, 3, 5, 7, 9]), 70, 'Example 2';

done_testing;

sub summations {
    my ($numbers) = @_;

    return unless @$numbers;

    while (@$numbers > 2) {
        my @_numbers = ($numbers->[1]);
        $_numbers[$_] = $numbers->[$_ + 1] + $_numbers[$_ - 1]
            for (1 .. @$numbers-2);
        $numbers = \@_numbers;
    }

    return $numbers->[-1];
}
