#!/usr/bin/env raku

sub findDivisors( Int $num ) {
  my @divisors ;
  for (1..$num) -> $i {
      if ( $num %% $i ) {
    @divisors.push( $i ) ;
      }
  }
  return @divisors ;
}

sub findBaseStrings( Str $string ) {
  my @baseStrings ;
  my $len = $string.chars ;
  my @divisors = findDivisors( $len ) ;
  for @divisors -> $i {
      my $part = $string.substr( 0 , $i ) ;
      my $times = $len div $i ;
      if ( ($part xx $times).join eq $string ) {
    @baseStrings.push( $part ) ;
      }
  }
  return @baseStrings ;
}

sub MAIN($A = 'abcdabcd', $B = 'abcdabcdabcdabcd') {
  my @baseStringsA = findBaseStrings( $A ) ;
  my @baseStringsB = findBaseStrings( $B ) ;
  say sort @baseStringsA.Set (&) @baseStringsB.Set;
}
