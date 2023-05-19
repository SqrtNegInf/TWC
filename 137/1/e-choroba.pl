#!/usr/bin/env perl
use v5.36;

use Time::Piece;

sub long_year {
    my ($from, $to) = @_;
    my @long;
    for my $year ($from .. $to) {
        my $tp = 'Time::Piece'->strptime("$year-12-31", '%Y-%m-%d');
        push @long, $year if $tp->week == 53;
    }
    return \@long
}

use Test2::V0 -srand => 1234;
plan 1;

is long_year(1900, 2100),
    [1903, 1908, 1914, 1920, 1925,
     1931, 1936, 1942, 1948, 1953,
     1959, 1964, 1970, 1976, 1981,
     1987, 1992, 1998, 2004, 2009,
     2015, 2020, 2026, 2032, 2037,
     2043, 2048, 2054, 2060, 2065,
     2071, 2076, 2082, 2088, 2093,
     2099],
    'Example';
