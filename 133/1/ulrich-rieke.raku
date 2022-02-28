#!/usr/bin/env raku

sub MAIN( Int $N is copy = 10 ) {
  my Int $current = 0 ;
  repeat {
      $current++ ;
  } until ( $current * $current > $N ) ;
  say --$current ;
}
