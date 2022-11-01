#!/usr/bin/env raku

my @numbers = (4, 5, 1, 6, 2);
my $k = @numbers[*-1] ;
my $len = @numbers.elems ;
my $count = 0 ;
for (0 .. $len - 3 ) -> $i {
  for ( $i + 1 .. $len - 2 ) -> $j {
      if (@numbers[ $i ] + @numbers[ $j ] ) %% $k {
    $count++ ;
      }
  }
}
say $count ;
