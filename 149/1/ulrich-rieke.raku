#!/usr/bin/env raku

sub inFibo( $n , @numbers ) {
  return $n == 0 || $n == 1 || $n (elem) @numbers[2..@numbers.elems - 1].Set ;
}

sub MAIN( Int $N = 20) {
  my @fibonaccis = (0 , 1) ;
  while ( @fibonaccis.elems < 8 ) {
      @fibonaccis.push( @fibonaccis[*-1] + @fibonaccis[*-2] ) ;
  }
  my @fibonacciDigitSum ;
  my $current = -1 ;
  my $sumOfDigits ;
  while ( @fibonacciDigitSum.elems < $N ) {
      $current++ ;
      $sumOfDigits = (~$current).comb.map( {.Int} ).sum ;
      if ( inFibo( $sumOfDigits , @fibonaccis) ) {
    @fibonacciDigitSum.push( $current ) ;
      }
      if ( $sumOfDigits > @fibonaccis[*-1] ) {
    repeat {
        @fibonaccis.push( @fibonaccis[*-1] + @fibonaccis[*-2] ) ;
    } until ( $sumOfDigits < @fibonaccis[*-1] ) ;
      }
    }
  say my $result = @fibonacciDigitSum.join( ',' ) ;
  use Test;
  is $result, '0,1,2,3,5,8,10,11,12,14,17,20,21,23,26,30,32,35,41,44';
}
