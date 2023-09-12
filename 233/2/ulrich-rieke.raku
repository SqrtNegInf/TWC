#!/usr/bin/env raku

sub count( @array , $element ) {
   return @array.grep( {$_ == $element} ).elems ;
}

my @numbers = (1,1,2,2,2,3);
my @uniques = @numbers.unique ;
my %frequencies ;
for @uniques -> $num {
   %frequencies{ $num } = count( @numbers , $num ) ;
}
my @sorted = @uniques.sort( { %frequencies{$^a} <=> %frequencies{$^b} || 
      $^b <=> $^a } ) ;
my @result ;
for @sorted -> $num {
   for (1..%frequencies{ $num } ) {
      @result.push( $num ) ;
   }
}
say "(" ~ @result.join( ',' ) ~ ")" ;
