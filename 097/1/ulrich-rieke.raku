#!/usr/bin/env raku

sub MAIN( Str $S = 'RAKU ROCKS', Int $N = 13 ) {
  my @alphabet = ('A' .. 'Z') ;
  my @ciphers = @alphabet.rotate( -($N mod 26)) ;
  my %correlations ;
  %correlations{ ' ' } = ' ' ;
  for (0 .. 25 ) -> $i {
      %correlations{ @alphabet[ $i ] } = @ciphers[ $i ] ;
  }
  say $S.comb.map( { %correlations{ $_ } } ).join ;
}
