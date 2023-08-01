#!/usr/bin/env perl

use strict;
use warnings;
use  feature 'say';

use Date::Calc qw/Day_of_Week/;

my $year = 2023;
my $month = 1;
my $day = 1;
while ($month <= 12){
    my $dow = Day_of_Week($year,$month,13);
    if ($dow == 5) {
        say "$year $month 13 : was a Friday";
    }
    $month++;
}
