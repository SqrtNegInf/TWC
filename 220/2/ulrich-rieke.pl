#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use Algorithm::Combinatorics qw( permutations ) ;
use POSIX ;

sub condition {
  my $permu = shift ;
  my $len = shift ;
  for my $i (0..scalar( @{$permu} ) - 2 ) {
      my $sum = $permu->[ $i ] + $permu->[ $i + 1 ] ;
      my $root = sqrt( $sum ) ;
      my $rootint = floor( $root ) ;
      if ( $rootint * $rootint != $sum ) {
    return 0 ;
      }
  }
  return 1 ;
}

my @numbers = (3,6,10,15);
my $len = scalar( @numbers ) ;
my $iter = permutations( \@numbers ) ;
print "(" ;
while ( my $c = $iter->next ) {
  if ( condition( $c , $len ) ) {
      print "(" . join( ',' , @$c ) . ") " ;
  }
}
say ")" ;
