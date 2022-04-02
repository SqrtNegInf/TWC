#!/usr/bin/env raku

sub MAIN( ) {
  my @neighbours ;
  my @A = (7, 8, 3, 12, 10);
  my $len = @A.elems ;
  @neighbours.push( 0 , @A[ 0 ] ) ;
  for ( 2..$len - 1 ) -> $i {
      if ( all (@A[0..$i - 1]) == @A[ 0 ] ) {
    @neighbours.push( 0 ) ;
      }
      else {
    @neighbours.push( @A[0..$i - 1].min ) ;
      }
  }
  say @neighbours ;
}
