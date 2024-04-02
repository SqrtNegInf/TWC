#!/usr/bin/env raku

my @numbers = (3,1,2,2,2,1,3);
my $k = 2;
my $len = @numbers.elems ;
my $sum = 0 ;
for (0..$len - 1).combinations( 2 ) -> $combi {
   if ( @numbers[ $combi[0] ] == @numbers[ $combi[ 1 ] ] && ( $combi[0 ] *
	    $combi[ 1 ] ) %% $k ) {
      $sum++ ;
   }
}
$sum.say ;
