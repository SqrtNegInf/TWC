#!/usr/bin/env raku

my @numbers = (1, 3, 2, 3, 1);
my $sum = 0 ;
my $len = @numbers.elems ;
for (0..$len - 2 ) -> $i {
   for ( $i + 1 .. $len - 1 ) -> $j {
      if ( @numbers[ $i ] > 2 * @numbers[ $j ] ) {
	 $sum++ ;
      }
   }
}
$sum.say ;
