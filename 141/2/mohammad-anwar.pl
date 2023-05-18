#!/usr/bin/env perl
use v5.36;

use Test::More;
use Test::Deep;
use Algorithm::Combinatorics qw(combinations);

is_deeply(
    like_numbers(1234, 2),
    [2, 4, 12, 14, 24, 34, 124, 134, 234],
    'Example 1'
);

is_deeply(
    like_numbers(768, 4),
    [8, 76, 68],
    'Example 2'
);

done_testing;

sub like_numbers {
    my ($m, $n) = @_;

    my @numbers = ();
    foreach my $i (1 .. length($m)-1) {
        foreach my $j (combinations([ split //, $m ], $i)) {
            my $k = join('', @$j);
            if ($k % $n == 0) {
                push @numbers, $k;
            }
        }
    }

    return \@numbers;
}
