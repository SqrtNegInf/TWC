#!/usr/bin/env raku

my @numbers = (3,2,3,2,2,2);

my %frequencies ;
for @numbers -> $num {
   %frequencies{ $num }++ ;
}
if (%frequencies.values.grep( { $_ %% 2 } ).elems == %frequencies.values.elems) {
   my @sorted = @numbers.sort( { $^a <=> $^b } ) ;
   my $len = @sorted.elems ;
   my $pos = 0 ;
   my @result ;
   while ( $pos <= $len - 2 ) {
      my $pair = [@sorted[ $pos ] , @sorted[ $pos + 1 ]] ;
      @result.push( $pair ) ;
      $pos += 2 ;
   }
   print "(" ;
   for @result -> $p {
      print  "( $p[0] , $p[1] )" ;
   }
   say ")" ;
}
else {
   say "()" ;
}

