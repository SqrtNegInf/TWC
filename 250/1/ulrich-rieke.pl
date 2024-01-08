#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use List::Util qw ( min ) ;

my @numbers = (0, 1, 2);
my @selected ;
for my $pos ( 0..scalar( @numbers ) - 1 ) {
   if ( $pos % 10 == $numbers[ $pos ] ) {
      push @selected , $pos ;
   }
}
if ( @selected ) {
   say min( @selected ) ;
}
else {
   say -1 ;
}
