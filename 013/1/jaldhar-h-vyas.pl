#!/usr/bin/env perl
use warnings;
use strict;
use 5.010;

sub elapsedLeapDays {
    my ($year) = @_;

    # Subtractions because we want 1-based years here.
    return int(($year - 1753) / 4)
        - int(($year - 1701) / 100)  # exclude centennial years >= 1800
        + int(($year - 1601) / 400); # include  quadricentennial years >= 2000
}

sub isLeap {
    my ($year) = @_;

    # years divisible by 100 are not leap years unless they are divisble by 400.
    return ($year % 4 == 0 && ($year % 100 != 0 || $year % 400 == 0));
}

my $year = 2019;

my $elapsedDays = ($year - 1753) * 365 + elapsedLeapDays($year);
my $newYearDay = ($elapsedDays + 1) % 7; # +1 because 1753/1/1 was a Monday.

my @lastDays = (30, 58, 89, 119, 150, 180, 211, 242, 272, 303, 333, 364);
# account for Feb 29 in leap years.
if (isLeap($year)) {
    for my $month (1 .. 11) {
        $lastDays[$month]++;
    }
}
my @offset = (2, 3, 4, 5, 6, 0, 1);

 for my $month (0 .. 11) {
    my $lastDay = $lastDays[$month];
    my $lastFriday = $lastDay - $offset[($newYearDay + $lastDay) % 7];

    my $day = $lastFriday - (($month > 0) ? $lastDays[$month - 1] : -1);

    say join q{/}, ($year, $month + 1, $day);
}
