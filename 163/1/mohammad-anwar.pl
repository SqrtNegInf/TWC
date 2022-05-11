#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Algorithm::Combinatorics qw(combinations);

is bitwise_and([1, 2, 3]), 3, 'Example 1';
is bitwise_and([2, 3, 4]), 2, 'Example 2';
is bitwise_and([1, 2, 3, 10]), 7, 'Example 3';

done_testing;

#
#
# METHOD

sub bitwise_and {
    my ($numbers) = @_;

    return unless @$numbers;

    my $sum = 0;
    $sum += $_->[0] & $_->[1] for (combinations($numbers, 2));

    return $sum;
}
