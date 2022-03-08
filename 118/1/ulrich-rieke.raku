#!/usr/bin/env raku

sub MAIN( Int $N is copy = 99 ) {
  my $binaryString =  $N.base( 2 ) ;
  if ( $binaryString eq $binaryString.flip ) {
      say 1 ;
  }
  else {
      say 0 ;
  }
}
