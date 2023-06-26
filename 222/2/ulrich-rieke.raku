#!/usr/bin/env raku

sub find_position( @array , $value ) {
  my $pos = 0 ;
  while ( @array[ $pos ] != $value ) {
      $pos++ ;
  }
  return $pos ;
}

my @numbers = (2, 7, 4, 1, 8, 1);
my $len = @numbers.elems ;
if ( $len == 1 ) {
  say @numbers[ 0 ] ;
}
else {
  my @sorted = @numbers.sort( { $^a <=> $^b } ) ;
  while ( $len > 1 ) {
      my @differences ;
      for (0..$len - 2 ) -> $i {
    @differences.push( (@sorted[ $i + 1 ] - @sorted[ $i ]).abs ) ;
      }
      my @not_null = @differences.grep( { $_ > 0 } ) ;
      if ( @not_null.elems > 0 ) {
    my $minimum = @not_null.min ;
    my $pos = find_position( @differences , $minimum ) ;
    @sorted.splice( $pos , 2 , ($minimum) ) ;
      }
      else {
    if ( $len > 1 ) {
        @sorted.splice(0 , 2 , <0> ) ;
    }
      }
      $len = @sorted.elems ;
  }
  say @sorted[ 0 ] ;
}
