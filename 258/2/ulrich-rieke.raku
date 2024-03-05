#!/usr/bin/env raku
my @numbers = (2, 5, 9, 11, 3);
my $k = 1;
my $sum = 0 ;
my $len = @numbers.elems ;
for (0..$len - 1 ) -> $i {
   my @digits = $i.base( 2 ).comb.map( {.Int} )  ;
   if ( @digits.grep( { $_ == 1 } ).elems == $k ) {
      $sum += @numbers[ $i ] ;
   }
}
say $sum ;
