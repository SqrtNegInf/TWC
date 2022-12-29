#!/usr/bin/env raku

sub findEnd( @numbers , $start ) {
  my $current = $start ;
  my $len = @numbers.elems ;
  $current = $start + 1 ;
  if ( $current == $len ) {
      return $start ;
  }
  else {
      while ( @numbers[ $current ] - @numbers[ $current - 1 ] == 1 ) {
    $current++ ;
    if ( $current == $len ) {
        last ;
    }
      }
      $current-- ;
      return $current ;
  }
}

my @numbers = <1 2 3 6 7 9>;
my @sorted = @numbers.sort( {$^a <=> $^b} ) ;
my $pos = 0 ;
my @subsequences ;
while ($pos < @numbers.elems - 1) {
  my $end = findEnd( @numbers , $pos ) ;
  if ( $end - $pos > 0 ) {
      @subsequences.push( [@numbers[ $pos ] , @numbers[ $end ] ] ) ;
  }
  $pos = $end + 1 ;
}
@subsequences.map( { "[" ~ $_.join( ',' ) ~ "]" } ).join( ',' ).say ;
