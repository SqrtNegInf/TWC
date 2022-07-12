#!/usr/bin/env raku

my ($m , $n ) =  (38, 2);

my @primes ;
for (2 .. $m) -> $i {
  if ( $i.is-prime ) {
      @primes.push( $i ) ;
  }
}

say @primes.combinations( $n ).grep( {@_.sum == $m} ) ;
