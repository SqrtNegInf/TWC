#!/usr/bin/env perl
use v5.36;

use Date::Simple (':all');

my @ARGV = (2024,4,3,2);

my $year = sprintf("%02d",$ARGV[0]);
my $month = sprintf("%02d",$ARGV[1]);
my $weekday_of_month = sprintf("%02d",$ARGV[2]);
my $day_of_week = $ARGV[3];
my $cnt = 0;
my $fnd = 0;

say "Input: Year = $year, Month = $month, Weekday of month = $weekday_of_month, day of week = $day_of_week";

for (my $d = 1; $d < 31; $d++) {
    $d = sprintf("%02d",$d);
    my $s = "$year-$month-$d";
    my $date  = Date::Simple->new($s);
    my $dow = $date->day_of_week();
    if ($dow == $day_of_week){
        $cnt++;
        if ($cnt == $weekday_of_month) {
            say "Output: ",substr($s,8,2);
            $fnd++;
            last;
        }
    }
}

if ($fnd == 0) {
    say "Output: 0";
}
