#!/usr/bin/env raku

my $line = 2⁶⁴ +1;
my $binaryStr = $line.Int.base( 2 ) ;
my @digits = $binaryStr.comb ;
for @digits <-> $digit {
  if ( $digit == 0 ) {
      $digit = 1 ;
  }
  else {
      $digit = 0 ;
  }
}
say @digits.join.parse-base( 2 ) ;
