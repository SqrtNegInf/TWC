#!/usr/bin/env raku

my @numbers = (0, 2, 1, 5, 3, 4);
my @newNumbers ;
for (0..@numbers.elems - 1) -> $i {
   my $num = @numbers[ $i ] ;
   @newNumbers.push( @numbers[ $num ] ) ;
}
say "(" ~ @newNumbers.join( ',' ) ~ ")" ;
