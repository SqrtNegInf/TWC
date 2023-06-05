#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (-2,-1,0,3,4);
my @sorted = sort { $a <=> $b } map { $_ ** 2 } @numbers ;
say "(" . join( ',' , @sorted ) . ")" ;
