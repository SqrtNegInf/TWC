#!/usr/bin/env perl

=head1

Week 191:

    https://theweeklychallenge.org/blog/perl-weekly-challenge-191

Task #1: Twice Largest

    You are given list of integers, @list.

    Write a script to find out whether the largest item in the list
    is at least twice as large as each of the other items.

=cut

use v5.36;
use Test2::V0 -srand => 1;

is twice_largest(1, 2, 3, 4), -1, 'Example 1';
is twice_largest(1, 2, 0, 5),  1, 'Example 2';
is twice_largest(2, 6, 3, 1),  1, 'Example 3';
is twice_largest(4, 5, 2, 3), -1, 'Example 4';

done_testing;

#
#
# METHOD

sub twice_largest(@list) {
    @list   = sort { $a <=> $b } @list;
    my $max = pop @list;
    foreach (@list) {
        ($_ * 2 > $max) and return -1;
    }

    return 1;
}
