#!/usr/bin/env raku

sub MAIN( Int $m  = 5, Int $n  = 3 ) {
  .say for (1...$m).combinations( $n ) ;
}
