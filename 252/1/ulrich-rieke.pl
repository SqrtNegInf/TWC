#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @numbers = (1, 2, 3, 4);
my $len = scalar( @numbers ) ;
my $sum = 0 ;
for my $i (0..$len - 1 ) {
   if ( $len % ( $i + 1 ) == 0 ) {
      $sum += $numbers[ $i ] ** 2 ;
   }
}
say $sum ;
