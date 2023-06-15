#!/usr/bin/env perl
use v5.36;

my @list = (10, 4, 1, 8, 12, 3);
my @indexes = (0,2,5);

my @sorted_values = sort {$a <=> $b} @list[@indexes];

splice @list, $_, 1, shift @sorted_values for (@indexes);

print join ',', @list;
