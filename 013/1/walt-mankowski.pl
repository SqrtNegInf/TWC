#!/usr/bin/env perl
use v5.36;

use Time::Local;

my $year = shift @ARGV || current_year();
my $leap = is_leap($year);
my @dim = ([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
           [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
          );

for my $mon (0..11) {
    # get dow for first of the month
    my $dom = 1;
    my $time = timelocal(undef, undef, undef, $dom, $mon, $year);
    my $dow = (localtime($time))[6];

    # advance $dom to Friday
    $dom += (5 - $dow) % 7;

    # advance $dom to last Friday
    $dom += 7 until $dim[$leap]->[$mon] - $dom < 7;

    # print it
    printf "%d/%02d/%d\n", $year, $mon+1, $dom;
}

sub current_year() {
    return (localtime)[5] + 1900;
}

sub is_leap($year) {
    return $year % 400 == 0 || ($year % 4 == 0 && $year % 100 != 0);
}

