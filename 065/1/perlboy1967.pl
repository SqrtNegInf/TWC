#!/usr/bin/env perl

# Perl Weekly Challenge - 065
#
# Task 1 - Digit Sum 
#
# Author: Niels 'PerlBoy' van Dijke

use strict;
use warnings;

use List::Util qw(sum);

@ARGV = (2,10) unless (scalar @ARGV > 1);
my ($N, $S) = @ARGV;

die "Wrong input" unless (
  $N =~ /^\d+$/ && $S =~ /^\d+$/ && $S >= $N);

my @v = grep { sum(split(//)) == $S} ('0' .. '9' x $N);

print join(', ', @v) . "\n";
