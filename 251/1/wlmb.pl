#!/usr/bin/env perl
use v5.36;

my @ARGV = (10, 7, 31, 5, 2, 2);
die <<~"FIN" unless @ARGV;
    Usage: $0 N1 [N2...]
    to concatenate and add the numbers N_1 . N_k + N_2 . N_{k-1} +...
    FIN
my $tot=0;
my @ints=@ARGV;
$tot += shift(@ints).(pop(@ints)//"") while(@ints);
say "@ARGV -> $tot";
