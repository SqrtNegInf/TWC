#!/usr/bin/env raku

sub myRule( $aSeq ) {
  return $aSeq[0] < $aSeq[2] && $aSeq[2] < $aSeq[1] ;
}

my @numbers = [1,4,6,4,3,5,10];
my @combis = @numbers.combinations: 3 ;
my @selected = @combis.grep( { myRule( $_ ) } ) ;
if ( @selected.elems > 0 ) {
  say @selected[ 0 ] ;
}
else {
  say "()" ;
}
