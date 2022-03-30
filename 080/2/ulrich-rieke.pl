#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @array = (1, 4, 3, 2);
my $len = scalar @array ;
my $candies = $len ;
for my $i ( 0 .. $len - 1 ) {
  if ( $i < $len - 1 ) {
      if ( $array[ $i ] > $array[ $i + 1 ] ) {
    $candies++ ;
      }

  }
  if ( $i > 0 ) {
      if ( $array[ $i ] > $array[ $i - 1 ] ) {
    $candies++ ;
      }
  }
}
say " " ;
say $candies ;

