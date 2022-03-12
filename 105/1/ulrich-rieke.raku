#!/usr/bin/env raku
use v6 ;

sub MAIN( Int $root =5 , Int $number = 34) {
  say (1 / $root).exp( $number ) ;
}
