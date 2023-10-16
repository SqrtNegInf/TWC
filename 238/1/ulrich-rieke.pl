#!/usr/bin/env perl

use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (1, 2, 3, 4, 5);
my $len = scalar( @numbers ) ;
my $current_sum = 0 ;
my @result ;
for my $i (0..$len - 1 ) {
   $current_sum += $numbers[ $i ] ;
   push @result , $current_sum ;
}
say "(" . join( ',' , @result ) . ")" ;
