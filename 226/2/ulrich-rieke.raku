#!/usr/bin/env raku

sub mySubtr( $n is copy , $d is copy ) {
   $n -= $d ;
   if ( $n < 0 ) {
      $n = 0 ;
   }
   return $n ;
}


my @numbers = (1, 5, 0, 3, 5);
my $rounds = 0 ;
while ( not (so 0 == @numbers.all )) {
   my $minimum = @numbers.grep( {$_ > 0} ).min ;
   @numbers = @numbers.map( { mySubtr( $_ , $minimum ) } ) ;
   $rounds++ ;
}
say $rounds ;
