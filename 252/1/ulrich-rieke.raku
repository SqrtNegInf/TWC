#!/usr/bin/env raku

my @numbers = [1, 2, 3, 4];
my $sum = 0 ;
my $len = @numbers.elems ;
for ( 0..$len - 1 ) -> $i {
   if ( $len %% ( $i + 1 )) {
      $sum += @numbers[$i]** 2 ;
   }
}
say $sum ;
