#!/usr/bin/env raku

my @numbers = ( -8,  2, -9,  0, -4, 3);
if ( @numbers.elems == 3 ) {
  say [*] @numbers ;
}
else {
  my @products ;
  my @combinations = @numbers.combinations( 3 ) ;
  for @combinations -> $combi {
      my $prod = 1 ;
      for (0..2) -> $i {
    $prod *= $combi[ $i ] ;
      }
      @products.push( $prod ) ;
  }
  my @sorted = @products.sort( { $^b <=> $^a } ) ;
  say @sorted[ 0 ] ;
}
