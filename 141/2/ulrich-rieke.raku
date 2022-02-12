#!/usr/bin/env raku

#sub MAIN( Int $m is copy , Int $n is copy ) {
my ($m,$n) = 1234, 2;
  my @numbers = (~$m).comb.map( {.Int} ) ;
  my @digits = @numbers ;
  my $len = @numbers.elems ;
  if ( $len > 2 ) {
      for ( 2 .. $len - 1 ) -> $l {
    my @combis = @digits.combinations( $l ).map( {.join.Int} ) ;
    @combis.map( { @numbers.push( $_ ) } ) ;
      }
  }
  say @numbers.grep( { $_ %% $n } ).elems ;
#}
