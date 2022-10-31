#!/usr/bin/env perl

=head1

Week 188:
    https://theweeklychallenge.org/blog/perl-weekly-challenge-188

Task #2: Total Zero
    You are given two positive integers $x and $y.
    Write a script to find out the number of operations needed to
    make both ZERO. Each operator is made up either of the following:
        $x = $x - $y if $x >= $y
        or
        $y = $y - $x if $y >= $x
=cut

use Test2::V0 -srand => 1;

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
