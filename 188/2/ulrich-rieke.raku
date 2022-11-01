#!/usr/bin/env raku

my ( $x , $y ) = 4, 6;
if ( $x == $y ) {
  say 1 ;
}
else {
  my $count = 0 ;
  while ( $x != $y ) {
      if ( $x > $y ) {
    $x -= $y ;
      }
      else {
    $y -= $x ;
      }
      $count++ ;
  }
  $count++ ;
  say $count ;
}
