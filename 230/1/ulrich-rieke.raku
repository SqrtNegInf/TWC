#!/usr/bin/env raku

sub decompose( $number is copy ) {
   my @digits ;
   while ( $number != 0 ) {
      @digits.push( $number % 10 ) ;
      $number = $number div 10  ;
   }
   @digits .= reverse ;
   return @digits ;
}

my $line = '1 34 5 6';
my @allDigits ;
my @numbers = $line.words.map( {.Int} ) ;
for @numbers -> $num {
   my @digits = decompose( $num ) ;
   for @digits -> $i {
      @allDigits.push( $i ) ;
   }
}
say '(' ~ @allDigits.join( ',' ) ~ ')' ; 
