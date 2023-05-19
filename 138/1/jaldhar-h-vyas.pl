#!/usr/bin/env perl
use v5.36;

sub p {
    my ($year) = @_;
    return (($year + int($year / 4) - int($year / 100) +  int($year / 400)) % 7);
}

sub isLeap {
    my ($year) = @_;
    return $year % 4 == 0 && ($year % 100 != 0 || $year % 400 == 0);
}

my $year = shift // 2022;

my $workDays = 260;
my $firstDay = p($year);

if ($firstDay > 0 && $firstDay < 6) {
    $workDays++;
}

if (isLeap($year) && $firstDay != 1) {
    $workDays++;
}

say $workDays;
