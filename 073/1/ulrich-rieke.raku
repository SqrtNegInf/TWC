#!/usr/bin/env raku

sub MAIN( Int $W = 3) {
  my @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
  my $len = @A.elems ;
  my @minimums ;
  if ( $len < $W ) {
      say "array too small for given window!" ;
  }
  else {
      for (0..$len - $W ) -> $i {
    @minimums.push( @A[$i..$i + $W - 1].min ) ;
      }
  }
  say @minimums ;
}
