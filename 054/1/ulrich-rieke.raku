#!/usr/bin/env raku

sub MAIN( Int $n =3, Int $k =4 ) {
  my $seq = (1..$n).permutations ;
  my $elNum = $seq.elems ;
  if ( $k > $elNum ) {
      say ( ) ;
  }
  else {
      say $seq[ $k - 1 ] ;
  }
}
