#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use List::Util qw ( product ) ;

sub decompose {
   my $number = shift ;
   my @digits ;
   while ( $number != 0 ) {
      my $remainder = $number % 10 ;
      push @digits , $remainder ;
      $number = int( $number / 10 ) ;
   }
   return @digits ;
}

sub findSteps {
   my $number = shift ;
   if ( $number < 10 ) {
      return 0 ;
   }
   else {
      my @digits = decompose( $number ) ;
      my $steps = 1 ;
      my $prod = product( @digits ) ;
      while ( $prod > 9 ) {
	 $steps++ ;
	 @digits = decompose( $prod ) ;
	 $prod = product( @digits ) ;
      }
      return $steps ;
   }
}

my @numbers = (15, 99, 1, 34);
my @sorted = sort { findSteps( $a ) <=> findSteps( $b ) || $a <=> $b }
 @numbers ;
say "(" . join( ',' , @sorted ) . ")" ; 
