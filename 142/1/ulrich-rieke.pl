#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $m = $ARGV[ 0 ] // 24;
my $n = $ARGV[ 1 ] //  2;
my @divisors ;
for my $i (1 .. $m ) {
  if ( $m % $i == 0 ) {
      push @divisors , $i ;
  }
}
my $output = 0 ;
for my $num ( @divisors ) {
  if ( $num % 10 == $n ) {
      $output++ ;
  }
}
say $output ;
