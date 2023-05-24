#!/usr/bin/env perl
use v5.36;

my $sum = 0;
my $num = 1;

my @avg = map { $sum += $_; $sum/$num++ } @ARGV;
print "@avg\n";
