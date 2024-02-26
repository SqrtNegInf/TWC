#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

my @A = (5, 2, 1, 6);
die <<~"FIN" unless @A;
    Usage: $0 N1 [N2...]
    to count how many numbers Nj are smaller than Ni
    FIN
my @sorted=sort {$a<=>$b} uniq @A;
my %count;
$count{$sorted[$_]}=$_ for 0..@sorted-1;
say "@A -> @count{@A}";
