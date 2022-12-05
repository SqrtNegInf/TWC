#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;
use Math::Combinatorics;

is binary_string(2), [qw(00 01 10 11)],                     'Example 1';
is binary_string(3), [qw(000 001 010 011 100 101 110 111)], 'Example 2';

done_testing;

#
#
# METHOD

sub binary_string($n) {
    my $bs = [];
    my $init = Math::Combinatorics->new(
        count     => $n,
        data      => [qw(0 1)],
        frequency => [$n, $n]
    );

    while (my @comb = $init->next_multiset) {
        my $entry = Math::Combinatorics->new(
            data      => \@comb ,
            frequency => [map{1} @comb]
        );
        while (my @val = $entry->next_string) {
            push @$bs, join(q{}, @val);
        }
    }

    return [sort @$bs];
}
