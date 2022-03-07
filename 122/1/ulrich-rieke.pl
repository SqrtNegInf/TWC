#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my @array = (10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
my @averages ;
my $len = scalar @array ;
my $sum = 0 ;
for my $i (0 .. $len - 1 ) {
  $sum += $array[ $i ] ;
  my $av = $sum / ( $i + 1 ) ;
  push @averages , $av ;
}
say join( ", " , @averages ) ;
