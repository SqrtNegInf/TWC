#!/usr/bin/env raku

my @numbers = (5,4,4,3);
my @uniques = @numbers.unique ;
if ( @uniques.elems < 3 ) {
  say @uniques.max ;
}
else {
  my @sorted = @uniques.sort( { $^b <=> $^a } ) ;
  say @sorted[2] ;
}
