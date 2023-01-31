#!/usr/bin/env raku

my $line = '0 1 3 5 9 10';
my @numbers = $line.words.map( {.Int} ) ;
my $numberset = @numbers.Set ;
my @missingNumbers ;

for (0..@numbers.elems) -> $n {
  unless ( $n (elem) $numberset ) {
      @missingNumbers.push( $n ) ;
  }
}
say @missingNumbers ;
