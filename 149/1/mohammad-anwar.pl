#!/usr/bin/env perl
use v5.36;

use Test::More;

is_deeply(
    fibonacci_digit_sum(20),
    [0, 1, 2, 3, 5, 8, 10, 11, 12, 14, 17, 20, 21, 23, 26, 30, 32, 35, 41, 44],
    'example'
);

done_testing;

#
#
# METHOD

sub fibonacci_digit_sum {
    my ($count) = @_;

    my @fibonacci = (0, 1);
    my @digit_sum = @fibonacci;
    my $index     = 2;
    while (@digit_sum < $count) {
        while ($fibonacci[-1] <= $index) {
            push @fibonacci, $fibonacci[-1] + $fibonacci[-2];
        }

        my $sum = 0;
        if ($index < 10) {
            $sum = $index;
        }
        else {
            $sum += $_ for (split //,$index);
        }

        if (grep /\b$sum\b/, @fibonacci) {
            push @digit_sum, $index;
        }

        $index++;
    }

    return \@digit_sum;
}
