#!/usr/bin/env raku

my @numbers = (0, 1, 4, 6, 7, 10);
my $diff = 3;
my @indices = (0..@numbers.elems - 1 ) ;
my $result = 0 ;
my @combis = @indices.combinations( 3 ) ;
for @combis -> $combi {
   if ( @numbers[ $combi[ 1 ] ] - @numbers[ $combi[ 0 ] ] == $diff 
	 && @numbers[ $combi[ 2 ] ] - @numbers[ $combi[ 1 ] ] == $diff ) {
      $result++ ;
   }
}
say $result ;
