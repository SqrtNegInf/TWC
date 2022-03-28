#!/usr/bin/env raku

sub findDivisors( Int $n ) {
  my @divisors = (1 .. $n).grep( { $n %% $_ } ) ;
  return @divisors ;
}

sub MAIN( Int $M = 100, Int $N = 500 ) {
  my @divisorsM = findDivisors( $M ) ;
  my @divisorsN = findDivisors( $N ) ;
  say sort @divisorsM.Set (&) @divisorsN.Set;
}
