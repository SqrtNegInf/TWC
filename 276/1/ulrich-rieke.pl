#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use Algorithm::Combinatorics qw ( combinations ) ;

my @numbers = (12, 12, 30, 24, 24);
my $total = 0 ;
my $iter = combinations( \@numbers , 2 ) ;
while ( my $c = $iter->next ) {
   if ( ($c->[0] + $c->[1]) % 24 == 0 ) {
      $total++ ;
   }
}
say $total ;
