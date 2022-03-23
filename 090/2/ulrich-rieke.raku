#!/usr/bin/env raku

sub MAIN( Int $A is copy = 238 , Int $B = 13 ) {
  my @factors ;
  my $num = 1 ;
  repeat { #keep pushing exponents of 2
      @factors.push( $num ) ;
      $num *= 2 ;
  } until ( $num > $A ) ;
  @factors.push( $num ) ;#and push the exponent above $A
  my @multfactors ;
  while ( $A > 0 ) {
      my $subtrahend = @factors.grep( { $_ <= $A } ).max ;
      @multfactors.push( $subtrahend ) ;
      $A -= $subtrahend ;
  }
  my $result = [+] @multfactors.map( { $_ * $B } ) ;
  say $result ;
}
