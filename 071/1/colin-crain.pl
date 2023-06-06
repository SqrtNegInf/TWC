#!/usr/bin/env perl
use v5.36;
srand 1;

my $n = shift @ARGV // 10;

## make a list of n unique numbers
## --> encapsulating the arr in 0s  
##     makes the comparisons at the ends easy
my @pool = (1..50);
my @arr = (0);
push @arr, splice( @pool, int(rand(@pool)) , 1 ) while (@arr < $n+1);
push @arr, 0;

say "input array: @arr[1..@arr-2]";

## map over the array indices, grepping the comparison and then 
## converting back into values
my @output = map  { $arr[$_] } 
             grep { ($arr[$_-1] < $arr[$_] && $arr[$_] > $arr[$_+1]) }
             (1..@arr-2);
           
say "peak values: @output";
