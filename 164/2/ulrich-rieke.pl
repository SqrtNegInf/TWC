#!/usr/bin/env perl
use v5.36;
use List::Util qw ( sum ) ;

sub squareSum {
  my $number = shift ;
  return sum( map { $_ ** 2 } split( // , $number )) ;
}

sub isHappy {
  my %seen ;
  my $number = shift ;
  my $sum = squareSum( $number ) ;
  $seen{ $sum }++ ;
  do {
      $sum = squareSum( $sum ) ;
      $seen{$sum}++ ;
  } until ( $sum == 1 || $seen{$sum} > 1 ) ;
  return ( $sum == 1 ) ;
}

my @happies ;
my $current = 1 ;
while ( scalar( @happies ) != 8 ) {
  if ( isHappy( $current ) ) {
      push @happies , $current ;
  }
  $current++ ;
}
say join( ',' , @happies) ;
