#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

use Algorithm::Combinatorics qw ( combinations ) ;

my @numbers = (3,1,2,2,2,1,3);
my $k = 2;
chomp $k ;
my $len = scalar( @numbers ) ;
my $sum = 0 ;
my @indices = (0..$len - 1 ) ;
my $iter = combinations(\@indices , 2 ) ;
while ( my $p = $iter->next ) {
   my $fst = $p->[0] ;
   my $snd = $p->[1] ;
   if ( $numbers[ $fst ] == $numbers[ $snd ] && ( ($fst * $snd) % $k == 0 )) {
      $sum++ ;
   }
}
say $sum ;

