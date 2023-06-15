#!/usr/bin/env perl
use v5.36;

use Time::Interval;
use Date::Parse;

my $min_intervals = coalesce([
                ['09:10', '09:45'],
                ['09:15', '09:33'],
                ['09:22', '09:55'],
                ['09:25', '10:05'],
                ['09:33', '10:01'],
                ['09:44', '10:12'],
                ['09:57', '10:23'],
                ['10:01', '10:19'],
                ['10:10', '11:00'],
]);

my $minutes = 0;
for (@$min_intervals) {
    my $s = str2time($_->[0])/60;
    my $e = str2time($_->[1])/60;
    $minutes += $e-$s;
}
say $minutes;
