#!/usr/bin/env raku

sub MAIN( Int $A = 7) {
  my $output = 0 ;
  my @array = (10, 8, 12, 15, 5);
  my @sorted = @array.sort( { $^b <=> $^a } ) ;
  for @sorted.combinations( 2 ) -> $combi {
      if ( $combi[ 0 ] - $combi[1] == $A ) {
    $output = 1 ;
    last ;
      }
  }
  say $output ;
}
