#!/usr/bin/env raku

my @numbers = (3,2,1);
my $len = @numbers.elems ;
my $max_greatness = 0 ;
my @allPermus = @numbers.permutations ;
for @allPermus -> $permu {
   my $current_greatness = 0 ;
   for (0..$len - 1) -> $pos {
      if ( $permu[ $pos ] > @numbers[ $pos ] ) {
	 $current_greatness++ ;
      }
   }
   if ( $current_greatness > $max_greatness ) {
      $max_greatness = $current_greatness ;
   }
}
say $max_greatness ;
