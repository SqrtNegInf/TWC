#!/usr/bin/env raku

#say "Enter some integers, separated by blanks!" ;
#my $line = $*IN.get ;
my @numbers = (1,2,3,3,3,3,4,2);
my @uniques = @numbers.unique ;
my $len = @numbers.elems ;
my @selected ;
for @uniques -> $num {
   if ( @numbers.grep( { $_ == $num } ).elems >= $len / 3 ) {
      @selected.push( $num ) ;
   }
}
if ( @selected ) {
   my @sorted = @selected.sort( {$^a <=> $^b} ) ;
   say @sorted[0] ;
}
else {
   say "undef" ;
}
