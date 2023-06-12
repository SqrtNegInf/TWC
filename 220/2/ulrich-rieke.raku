#!/usr/bin/env raku

sub condition( $aSeq , $len ) {
  for (0..$len - 2 ) -> $i {
      my $sum = $aSeq[ $i ] + $aSeq[ $i + 1 ] ;
      my $rootint = $sum.sqrt( ).floor( ) ;
      if ( $rootint * $rootint != $sum ) {
    return False ;
      }
  }
  return True ;
}

sub printSeq( $aSeq ) {
  print "(" ~ join( ',' , $aSeq.Array ) ~ ")" ;
}

#say "Enter some integers, separated by blanks!" ;
my @numbers = (3,6,10,15);
my $len = @numbers.elems ;
my @permus = @numbers.permutations( ) ;
my @solution = @permus.grep( {condition( $_ , $len) } ) ;
print "(" ;
for @solution -> $seq {
  printSeq( $seq ) ;
}
say ")" ;
