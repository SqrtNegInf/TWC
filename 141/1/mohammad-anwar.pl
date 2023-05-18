#!/usr/bin/env perl
use v5.36;

use Test::More;
use Test::Deep;

is_deeply(
    number_divisors(10, 8),
    [24, 30, 40, 42, 54, 56, 66, 70, 78, 88],
    'Example 1'
);

done_testing;

sub number_divisors {
    my ($count, $number) = @_;

    my @numbers = ();
    my $i = 1;
    while (@numbers < $count) {

        my @divisors = ();
        foreach my $j (1 .. $i) {
            if ($i % $j == 0) {
                push @divisors, $j;
            }
        }

        if (@divisors == $number) {
            push @numbers, $i;
        }

        $i++;
    }

    return \@numbers;
}
