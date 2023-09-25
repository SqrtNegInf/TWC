#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (1, 0, 2, 3, 0, 4, 5, 0);
my @result ;
my $len = scalar( @numbers ) ;
for my $n ( @numbers ) {
   if ( $n != 0 ) {
      push @result , $n ;
   }
   else {
      for (1 , 2 ) {
	 push @result , 0 ;
      }
   }
}
say "(" . join( ',' , @result[0..$len - 1] ) . ")" ;
