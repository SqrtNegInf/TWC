#!/usr/bin/env perl
use v5.36;

use List::Util qw ( sum ) ;

sub chowladivisors {
  my $n = shift ;
  if ( $n == 1 or $n == 2 or $n == 3 ) {
      return ( ) ;
  }
  else {
      my @divisors ;
      for my $i (2 .. $n - 1) {
    if ( $n % $i == 0 ) {
        push @divisors , $i ;
    }
      }
      return @divisors ;
  }
}

my @chowladivs = ( ) ;
my $n = 0 ;
while ( scalar @chowladivs < 20 ) {
  my @divs = chowladivisors( ++$n ) ;
  if ( scalar @divs == 0 ) {
      push @chowladivs, 0 ;
  }
  else {
      push @chowladivs , sum @divs ;
  }
}
say join( ", " , @chowladivs ) ;
