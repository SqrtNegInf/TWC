#!/usr/bin/env raku

my @numbers = (1,1,2,2,5,6);
my %frequencies ;
my @evens = @numbers.grep( { $_ %% 2 } ) ;
if ( @evens ) {
  for @evens -> $n {
      %frequencies{ $n }++ ;
  }
#sort in ascending order of frequency
  my @sorted = %frequencies.keys.sort: { %frequencies{$_} } ;
#so the last 2 numbers are the largest
  if ( @sorted[ *-1 ] != @sorted[ *-2 ] ) {
      say @sorted[*-1] ;
  }
  else {
      @sorted = @evens.sort ;
      say @sorted[0] ;
  }
}
else {
  say -1 ;
}
