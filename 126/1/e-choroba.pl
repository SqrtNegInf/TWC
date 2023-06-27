#!/usr/bin/env perl
use v5.36;

sub count_numbers_naive {
    my ($n) = @_;
    return grep ! /1/, 1 .. $n
}

sub count_numbers_fast {
    my ($n) = @_;
    my $count = 0;
    my $i = 2;
    while ($i <= $n) {
        ++$i;
        # Only one 1 can appear if there wasn't one, so we don't need /g.
        $i =~ s/1/2/;
        ++$count;
    }
    return $count
}

use Test2::V0 -srand => 1234;
plan 3;

is count_numbers_fast(15),  8, 'Example 1';
is count_numbers_fast(25), 13, 'Example 2';
is count_numbers_fast(200),81, 'Example 3';
