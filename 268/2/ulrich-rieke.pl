#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (2, 5, 3, 4);
my @sorted = sort { $a <=> $b } @numbers ;
my @target ;
while ( @sorted ) {
   my ( $smallest , $secsmallest ) = splice( @sorted , 0 , 2 ) ;
   push( @target , $secsmallest , $smallest ) ;
   @sorted = sort { $a <=> $b } @sorted ;
}
say "(" . join( ',' , @target ) . ")" ;
