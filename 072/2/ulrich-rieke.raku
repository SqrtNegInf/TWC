#!/usr/bin/env raku

sub MAIN( Str $file = 'input.txt', Int $A =3 , Int $B =6) {
  unless "$file".IO ~~:e {
      note "file $file doesn't exist!" ;
      exit 1 ;
  }
  my $n = 1 ;
  my @lines ;
  for $file.IO.lines -> $line {
      if ( $A <= $n <= $B ) {
    @lines.push( $line ) ;
      }
      if ( $n > $B ) {
    last ;
      }
      $n++ ;
  }
  .say for @lines ;
}
