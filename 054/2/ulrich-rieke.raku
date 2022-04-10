#!/usr/bin/env raku

sub findSequence( Int $n is copy ) {
  my @sequence ;
  while ( $n != 1 ) {
      @sequence.push( $n ) ;
      if ( $n %% 2 ) {
        $n div= 2 ;
      }
      else {
        $n = $n * 3 + 1 ;
      }
  }
  @sequence.push( $n ) ;
  return @sequence ;
}

sub MAIN( Int $n =23) {
  .say for findSequence( $n ) ;
  my @sequences ;
  for (1..10000) -> $num {
      my @sequence = findSequence( $num ) ;
      @sequences.push( ($num , @sequence.elems ) ) ;
  }
  my @sorted = @sequences.sort( { $^b[1] <=> $^a[1] } ) ;
  say "The sequence lengths of the longest sequences up to 1000000 are :" ;
  @sorted[0..4].map( { say "$_[0]  $_[1]" } ) ;
}
