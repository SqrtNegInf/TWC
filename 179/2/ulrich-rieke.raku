#!/usr/bin/env raku

sub findOctal( $number , @octals --> Int ) {
  my Int $current = 0 ;
  while ( @octals[$current] < $number ) {
      $current++ ;
      last if $current == 8 ;
  }
  if ( $current == 8 ) {
      return 7 ;
  }
  else {
      return $current ;
  }
}

my @numbers = (15,2500,35,-4500,55,65,75,8500);
my $max = @numbers.max ;
my $min = @numbers.min ;
my $range = $max - $min ;
my @octals ;
@octals.push( $min ) ;
for ( 1 .. 7 ) -> $i {
  @octals.push( $range / 8 * $i ) ;
}
@octals.push( $max ) ;
my @blockCodePoints = ( 0x2581 , 0x2582, 0x2583 , 0x2584 ,
      0x2585 , 0x2586 , 0x2587 , 0x2588) ;
my @octalQuantiles = @numbers.map( { findOctal( $_ , @octals ) } ) ;
for @octalQuantiles[0 .. @octalQuantiles.elems - 2] -> $octal {
  print @blockCodePoints[ $octal ].chr ;
}
say @blockCodePoints[ @octalQuantiles[*-1]].chr ;
