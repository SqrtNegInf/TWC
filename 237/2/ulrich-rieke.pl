#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use Algorithm::Combinatorics qw ( permutations ) ;

my @numbers = (1, 3, 5, 2, 1, 3, 1);
my $len = scalar( @numbers ) ;
my $max_greatness = 0 ;
my $iter = permutations( \@numbers ) ;
while ( my $p = $iter->next ) {
   my $current_greatness = 0 ;
   for my $i ( 0..$len - 1 ) {
      if ( $p->[ $i ] > $numbers[ $i ] ) {
	 $current_greatness++ ;
      }
   }
   if ( $current_greatness > $max_greatness ) {
      $max_greatness = $current_greatness ;
   }
}
say $max_greatness ;
