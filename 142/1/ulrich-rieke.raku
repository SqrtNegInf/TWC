#!/usr/bin/env raku

subset Positive of Int where * > 0 ;
sub MAIN( Positive $m = 24, Positive $n = 2) {
  my @divisors ;
  for (1 .. $m) -> $i {
      if ( $m %% $i ) {
    @divisors.push( $i ) ;
      }
  }
  say @divisors.grep( { $_ % 10 == $n } ).elems ;
}
