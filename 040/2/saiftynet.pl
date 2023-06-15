#!/usr/bin/env perl
use v5.36;

my @list= ( 10, 4, 1, 8, 12, 3 );               # list for selective sorting
my @Indices=(0,2,5);                            # list of indices to sort

say "Original list:- ",join " ",@list;          # display original list

@list[@Indices]=sort{$a <=> $b}@list[@Indices]; # sort index values

say "Modified list:- ",join " ",@list;          # display results after modification
