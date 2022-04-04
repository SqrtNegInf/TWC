#!/usr/bin/env raku

sub findZeroes( @array ) {
  my @zeroes ;
  my $len = @array.elems ;
  for (0..$len - 1 ) -> $i {
      if ( @array[ $i ] eq "0" ) {
    @zeroes.push( $i ) ;
      }
  }
  return @zeroes ;
}

sub MAIN( Int $m =3 , Int $n =3 ) {
  my @matrix = [[1,0,1], [1,1,1], [1,1,1]];
  my @zerolist ;
  for  @matrix -> @sublist {
      @zerolist.push( findZeroes( @sublist ) ) ;
  }
  for (0..@zerolist.elems - 1 ) -> $i {
      if ( @zerolist[ $i ] ) {
    for (0..$n - 1) -> $col {
        @matrix[ $i ][ $col ] = 0 ; #nullify row
    }
    for @matrix -> @row {
        for (0..@zerolist[ $i ].elems - 1) -> $column {
          @row[ @zerolist[ $i ][$column ]] = 0 ;
        }
    }
      }
  }
  for @matrix -> @aRow {
      @aRow.map( { print "$_ " } ) ;
      say " " ;
  }
}
