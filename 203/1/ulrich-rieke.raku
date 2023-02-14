#!/usr/bin/env raku

my @numbers = <9 0 1 2 3 4 5 6>;
my $specials = 0 ;
if ( @numbers.elems >= 4 ) {
  my @combis = @numbers.combinations( 4 ) ;
  for @combis -> $combi {
      if ( $combi[0] + $combi[1] + $combi[2] == $combi[3] ) {
    $specials++ ;
      }
  }
  say $specials ;
}
else {
  say "Enter at least 4 integers!" ;
}
