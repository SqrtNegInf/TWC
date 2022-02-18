#!/usr/bin/env perl

=pod

The Weekly Challenge - 138
 - https://perlweeklychallenge.org/blog/perl-weekly-challenge-138/#TASK1

Author: Niels 'PerlBoy' van Dijke

TASK #1 › Workdays
Submitted by: Mohammad S Anwar

You are given a year, $year in 4-digits form.

Write a script to calculate the total number of workdays in the given year.

 ||  For the task, we consider, Monday - Friday as workdays.

=cut

use v5.16;
use strict;
use warnings;

use Date::Calc qw(Day_of_Week Week_of_Year);

use Test::More;

my %tests = (
  2020 => 262, 2021 => 261, 2022 => 260, 2023 => 260,
);

foreach my $y (sort { $a <=> $b } keys %tests) {
  my ($dayOfWeek1,$dayOfWeek2) = (Day_of_Week($y,1,1),Day_of_Week($y,12,31));

  my $workingDays = 262;
  $workingDays-- if ($dayOfWeek1 > 5);
  $workingDays-- if ($dayOfWeek2 > 5);
  $workingDays-- if ($dayOfWeek1 == $dayOfWeek2 and $dayOfWeek1 < 6);

  is($workingDays,$tests{$y},"year=$y");
}

done_testing;
