#!/usr/bin/env perl
use v5.36;

sub isPermutedMultiple {
  my $number = shift ;
  my $startDigits = join ('' , sort { $a <=> $b } split ( // , $number )) ;
  my $mult = 2 ;
  my $productDigits ;
  while ( $mult != 6 ) {
      $productDigits = join( '' , sort { $a <=> $b } split( // ,
          $number * $mult )) ;
      if ( $productDigits ne $startDigits ) {
    return 0 ;
      }
      $mult++ ;
  }
  if ( join ( '' , sort { $a <=> $b } split ( // , $number * 6 )) eq
    $startDigits ) {
      return 1 ;
  }
  else {
      return 0 ;
  }
}

my $current = 1 ;
do {
  $current++ ;
} while ( not isPermutedMultiple( $current ) ) ;
say $current ;
