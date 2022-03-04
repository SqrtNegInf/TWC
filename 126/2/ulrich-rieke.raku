#!/usr/bin/env raku

sub countMines(  $row , $col , @lines ) {
  my $mines = 0 ;
  for ( $row - 1 .. $row + 1 ) -> $currentRow {
      for ( $col - 1 .. $col + 1 ) -> $currentCol {
    if (( -1 < $currentRow < 5 ) and ( -1 < $currentCol < 10 )) {
        if ( @lines[ $currentRow ].substr( $currentCol , 1 ) eq "x" ) {
          $mines++ ;
        }
    }
      }
  }
  @lines[ $row ].substr-rw( $col , 1 ) = ~$mines ;
}

sub MAIN( ) {
  #my @lines = enterInput( ) ;
  my @lines = $=finish.lines.map({ $_.split(/\s+/).Array });
  for (0 .. 4) -> $row {
      for ( 0 .. 9 ) -> $col {
    if ( @lines[ $row ].substr( $col , 1 ) eq "*" ) {
        countMines( $row , $col , @lines) ;
    }
      }
  }
  .say for @lines.map( { $_.comb.join( ' ' ) } ) ;
}

=finish
x * * * x * x x x x
* * * * * * * * * x
* * * * x * x * x *
* * * x x * * * * *
x * * * x * * * * x
