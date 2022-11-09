#!/usr/bin/env raku

sub findDegree( @array --> Int) {
  my %frequencies ;
  for @array -> $el {
      %frequencies{ $el }++ ;
  }
  return %frequencies.values.max( ) ;
}

my @numbers = (2, 1, 2, 1, 1);
my @subarrays ;
my $degree = findDegree( @numbers ) ;
if ( $degree == 1 ) {
  say @numbers.min ;
}
else {
  my $arraylen = @numbers.elems ;
  for ( $degree .. $arraylen) -> $stepwidth {
      for (0..$arraylen - $stepwidth) -> $start {
    my @subarray ;
    for ( 0..$stepwidth - 1 ) -> $pos {
        @subarray.push( @numbers[ $start + $pos ] ) ;
    }
    if ( findDegree( @subarray ) == $degree ) {
        @subarrays.push( @subarray ) ;
    }
      }
  }
  my @sortedArrays = @subarrays.sort: *.sum ;
  say @sortedArrays[0] ;
}
