#!/usr/bin/env raku

my @strings=<ab1234 cd5678 ef1342>;
my @output ;
for (0..@strings.elems - 1 ) -> $i {
  say $i ;
  if ( $i < 10 ) {
      @output.push( "0$i" ~ @strings[ $i ].substr( 2 ) ) ;
  }
  else {
      @output.push( ~$i ~ @strings[ $i ].substr( 2 ) ) ;
  }
}
say @output.join( ',' ) ;
