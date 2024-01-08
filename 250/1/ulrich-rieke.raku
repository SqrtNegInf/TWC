#!/usr/bin/env raku

my @numbers = (0, 1, 2);
my @selected ;
for (0..@numbers.elems - 1 ) -> $pos {
   if ( $pos % 10 == @numbers[ $pos ] ) {
      @selected.push( $pos ) ;
   }
}
if ( @selected ) {
   say @selected.min ;
}
else {
   say "-1" ;
}
