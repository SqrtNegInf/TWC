#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub isPerfectSquare {
  my $num = shift ;
  if ( $num < 0 ) {
      return 0 ;
  }
  else {
      my $root = sqrt( $num ) ;
      return $root == int( $root ) ;
  }
}

sub isRare {
  my $num = shift ;
  my $reversed = join( '' , reverse split( // , $num ) ) ;
  return ( isPerfectSquare( $num + $reversed ) and
    isPerfectSquare( $num - $reversed ) ) ;
}

my $N = 2;
say grep { isRare( $_ ) } (10 ** ( $N - 1 ) .. ( 10 ** $N) - 1 ) ;
