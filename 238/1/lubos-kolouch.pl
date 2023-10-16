#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

# Function to calculate the running sum of an array
sub running_sum {
    my @nums = @_;
    my $sum = 0;
    my @result;

    for my $num (@nums) {
        $sum += $num;
        push @result, $sum;
    }

    return \@result;
}

# Test cases
is_deeply(running_sum(1, 2, 3, 4, 5), [1, 3, 6, 10, 15], 'Test Case 1');
is_deeply(running_sum(1, 1, 1, 1, 1), [1, 2, 3, 4, 5], 'Test Case 2');
is_deeply(running_sum(0, -1, 1, 2), [0, -1, 0, 2], 'Test Case 3');

done_testing();
