#!/usr/bin/env raku

sub MAIN( Str $S is copy = 'The Weekly Challenge') {
  $S .= trim-leading ;
  $S .= trim-trailing ;
  my @words = $S.split( /\s+/ ) ;
  say @words.reverse.join( ' ' ) ;
}
