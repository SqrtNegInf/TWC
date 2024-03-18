#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

my @ARGV  = (1,2,2,1,1,3);

die <<~"FIN" unless @ARGV;
    Usage: $0 N1 [N2...]
    to test if the number of ocurrences of each number is unique.
    FIN
my %counts;
++$counts{$_} for @ARGV;
my @counts=values %counts;
my $result=@counts==(uniq @counts)||0;
say "@ARGV => $result";
