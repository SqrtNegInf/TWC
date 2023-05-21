#!/usr/bin/env perl
use v5.36;

sub odd_number {
    my @N = @_;
    my %odd;
    exists $odd{$_} ? delete $odd{$_} : undef $odd{$_} for @N;
    return (keys %odd)[0]
}

use Test2::V0 -srand => 1234;
plan 2;

is odd_number(2, 5, 4, 4, 5, 5, 2), 5, 'Example 1';
is odd_number(1, 2, 3, 4, 3, 2, 1, 4, 4), 4, 'Example 2';
