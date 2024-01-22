#!/usr/bin/env raku

my $number = 5;
my @solution ;
my $limit = $number div 2 ;
my $neg_limit = $limit * (-1) ;
if ( not $number %% 2 ) {
   for ( $neg_limit..$limit ) -> $num {
      @solution.push( $num ) ;
   }
}
else {
   my $current = $neg_limit ;
   for (1..$number - 1 ) {
      @solution.push( $current ) ;
      $current++ ;
   }
   my $sum = [+] @solution ;
   @solution.push( 0 - $sum ) ;
}
say "(" ~ @solution.join( ',' ) ~ ")" ;

