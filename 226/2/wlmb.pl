#!/usr/bin/env perl
use v5.36;

my @sorted = grep {$_} sort {$a <=> $b} my @in = (1, 5, 0, 3, 5);
my $count=0;
while(@sorted){
    ++$count;
    my $first=shift @sorted;
    $sorted[$_]-=$first for 0..@sorted-1;
    shift @sorted while @sorted and $sorted[0]==0;
}
say "@in -> $count";
