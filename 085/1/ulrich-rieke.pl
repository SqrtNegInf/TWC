#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use Algorithm::Combinatorics qw( combinations ) ;
use List::Util qw( sum ) ;

my @array = (1.2, 0.4, 0.1, 2.5);
my $triplets = 0 ;
my $iter = combinations( \@array , 3 ) ;
while ( my $p = $iter->next ) {
  my $sum = sum @$p ;
  if ( $sum > 1 and $sum < 2 ) {
      $triplets = 1 ;
      last ;
  }
}
say $triplets ;
