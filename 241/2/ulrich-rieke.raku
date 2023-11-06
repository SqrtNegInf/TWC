#!/usr/bin/env raku

sub findSmallest( $number is copy ) {
   my $divisor = 2 ;
   while ( not ( $number %% $divisor ) ) {
      $divisor++ ;
   }
   return $divisor ;
}

sub prime_decompose( $number is copy ) {
   my @primeFactors ;
   while ( $number != 1 ) {
      my $divisor = findSmallest( $number ) ;
      @primeFactors.push( $divisor ) ;
      $number div= $divisor ;
   }
   return @primeFactors ;
}

sub mySorter( $firstNum is copy , $secondNum is copy ) {
   my @factorsA = prime_decompose( $firstNum ) ;
   my @factorsB = prime_decompose( $secondNum ) ;
   my $lenA = @factorsA.elems ;
   my $lenB = @factorsB.elems ;
   if ( $lenA != $lenB ) {
      return $lenA <=> $lenB ;
   }
   else {
      return $firstNum <=> $secondNum ;
   }
}

my @numbers = [11,8,27,4];
my @sorted = @numbers.sort( {&mySorter( $^a , $^b ) } ) ;
say "(" ~ @sorted.join( ',' ) ~ ")" ;
