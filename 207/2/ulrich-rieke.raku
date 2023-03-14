#!/usr/bin/env raku

my @numbers = (10,8,5,4,3);
my @sorted = @numbers.sort( { $^b <=> $^a } ) ;
my @possible_h ;
for (0..@sorted.elems - 1 )  -> $i {
  if ( @sorted[ $i ] >= ( $i + 1 ) ) {
      @possible_h.push( $i + 1 ) ;
  }
}
say @possible_h.max ;
