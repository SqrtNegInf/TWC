#!/usr/bin/env raku

my @matrix = ((1,2,3,4),(5,6,7,8),(9,10,11,12));
my $matrix_len = @matrix.elems ;
my $row_len = @matrix[0].elems ;
my @result ;
for ( 0..$matrix_len - 2 ) -> $row {
   my @resultline ;
   for ( 0..$row_len - 2 ) -> $col {
      my $sum = @matrix[ $row ][ $col ] + @matrix[$row][$col + 1 ] +
	 @matrix[ $row + 1 ][ $col ] + @matrix[ $row + 1 ][$col + 1] ;
      @resultline.push( $sum ) ;
   }
   @result.push( @resultline ) ;
}
say "(" ;
for @result -> @columns {
   say ( "  (" ~ @columns.join( ',' ) ~ ")" ) ;
}
say ")" ;


