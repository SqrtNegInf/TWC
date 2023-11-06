#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub findSmallest {
   my $number = shift ;
   my $divisor = 2 ;
   while ( $number % $divisor != 0 ) {
      $divisor++ ;
   }
   return $divisor ;
}

sub findPrimeFactors {
   my $number = shift ;
   my @primeFactors ;
   while ( $number != 1 ) {
      my $divisor = findSmallest( $number ) ;
      push @primeFactors , $divisor ;
      $number /= $divisor ;
   }
   return @primeFactors ;
}

my @numbers = (11,8,27,4);
my @sorted = sort { scalar( findPrimeFactors( $a ) ) <=> 
   scalar( findPrimeFactors( $b ) ) || $a <=> $b } @numbers ;
say "(" . join( ',' , @sorted ) . ")" ;
