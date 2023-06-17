#!/usr/bin/env perl
use v5.36;

use Time::Piece;

sub sunday_xmas {
    my ($year) = @_;
    return 0 == 'Time::Piece'
        ->strptime("$year-12-25", '%Y-%m-%d')
        ->day_of_week
}

for my $year (2019 .. 2100) {
    say "25 Dec $year" if sunday_xmas($year);
}
