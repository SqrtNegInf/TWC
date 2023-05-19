#!/usr/bin/env perl
use v5.36;

use Date::Calc qw(Week_of_Year);

my @w53years;
foreach my $y (1900 .. 2099) {
  push(@w53years,$y) if Week_of_Year($y,12,31) == 53;
}

printf "Years: %s\n", join(', ', @w53years);
