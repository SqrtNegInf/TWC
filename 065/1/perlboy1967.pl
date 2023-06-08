#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

@ARGV = (2,10) unless (scalar @ARGV > 1);
my ($N, $S) = @ARGV;

die "Wrong input" unless (
  $N =~ /^\d+$/ && $S =~ /^\d+$/ && $S >= $N);

my @v = grep { sum(split(//)) == $S} ('0' .. '9' x $N);

print join(', ', @v) . "\n";
