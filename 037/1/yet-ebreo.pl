#!/usr/bin/env perl
use v5.36;

use POSIX;

my $year = 2019;
my @days = (31, 28 + is_leap($year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

for my $month ( 0 .. 11 ) {
    my $count = grep {
        strftime( "%w", 0, 0, 0, $_+6, $month, $year - 1900 ) < 5
    } 1 .. $days[$month];
    say strftime( "%b", 0, 0, 0, 1, $month, $year - 1900 ) . ": $count days";
}

sub is_leap {
    strftime("%w", 0, 0, 0, 29 , 1, $_[0] - 1900 ) ne
    strftime("%w", 0, 0, 0,  1 , 2, $_[0] - 1900 );
}
