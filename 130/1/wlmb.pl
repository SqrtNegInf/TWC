#!/usr/bin/env perl
use v5.36;

my %repetitions_of;
map {++$repetitions_of{$_}} (2, 5, 4, 4, 5, 5, 2);
my @output=grep {$repetitions_of{$_}%2} keys %repetitions_of;
#say "Input: ", join " ", @ARGV;
say "Output: ", @output==1?$output[0]:"Wrong input";
