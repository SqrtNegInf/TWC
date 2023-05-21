#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $FORMAT = '%Y/%m/%d';

sub create_mirror_dates
{
     my $date = Time::Piece->strptime($_[0], $FORMAT);
     my $today = Time::Piece->strptime('2021/09/22', $FORMAT); # or localtime
     my $difference = $today - $date; # seconds
     my $first = $date - $difference;
     my $second = $today + $difference;
     return $first->ymd('/'), $second->ymd('/'); 

}

print join(" ", create_mirror_dates('2021/09/18')), $/;
print join(" ", create_mirror_dates('1975/10/10')), $/;
print join(" ", create_mirror_dates('1967/02/14')), $/;
