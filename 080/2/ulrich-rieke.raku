#!/usr/bin/env raku

my @array = (1, 4, 3, 2);
my $len = @array.elems ;
my $candies = $len ;
for ( 0 .. $len - 1 ) -> $i {
  if ( $i < $len - 1 ) {
      if ( @array[ $i ] > @array[ $i + 1 ] ) {
    $candies++ ;
      }
  }
  if ( $i > 0 ) {
      if ( @array[ $i ] > @array[ $i - 1 ] ) {
    $candies++ ;
      }
  }
}
say $candies ;
