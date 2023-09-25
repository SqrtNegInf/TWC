#!/usr/bin/env raku


my @numbers = (1, 0, 2, 3, 0, 4, 5, 0);
my @result ;
for @numbers -> $n {
   if ( $n != 0 ) {
      @result.push( $n ) ;
   }
   else {
      for (1 , 2 ) {
	 @result.push( 0 ) ;
      }
   }
}
my $len = @numbers.elems ;
say "(" ~ @result[0..$len - 1 ].join( ',' ) ~ ")" ;
