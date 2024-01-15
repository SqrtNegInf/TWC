#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (10, 7, 31, 5, 2, 2);
my $sum = 0 ;
while ( @numbers ) {
   if ( scalar( @numbers ) > 1 ) {
      my $concat = ($numbers[0] . $numbers[-1]) + 0 ;
      $sum += $concat ;
      shift @numbers ;
      pop @numbers ;
   }
   else {
      $sum += $numbers[0] ;
      shift @numbers ;
   }
}
say $sum ;
      
