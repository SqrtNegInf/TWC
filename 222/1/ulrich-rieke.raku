#!/usr/bin/env raku

my @numbers = (1, 1, 4, 2, 1, 3);
my @sorted = @numbers.sort( {$^a <=> $^b } ) ;
my $samepos = 0 ;
for ( 0..@numbers.elems - 1 ) -> $i {
  if ( @numbers[ $i ] == @sorted[ $i ] ) {
      $samepos++ ;
  }
}
say $samepos ;
