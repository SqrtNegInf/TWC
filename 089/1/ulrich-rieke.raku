#!/usr/bin/env raku

sub MAIN( Int $N =100 ) {
  my @gcds ;
  for (1..$N).combinations( 2 ) -> $combi {
      @gcds.push( $combi[0] gcd $combi[1] ) ;
  }
  my $sum = [+] @gcds ;
  say $sum ;
}
