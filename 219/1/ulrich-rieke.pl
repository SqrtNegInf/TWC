#!/usr/bin/env perl
use v5.36;

my @numbers = (-2,-1,0,3,4);
my @sorted = sort { $a <=> $b } map { $_ ** 2 } @numbers ;
say "(" . join( ',' , @sorted ) . ")" ;
