#!/usr/bin/env perl6
## maybe slower, but do I care?
#    2023-09-19

my @testA = (0, 2, 9, 4, 1, 6);  # False 
my @testB = (0, 2, 9, 4,    6);  # True

say 1 == sum False Xeq  @testA »[≤]« (| @testA[1..*], Inf) ;
say 1 == sum False Xeq (@testB Z[≤]   | @testB[1..*], Inf );
