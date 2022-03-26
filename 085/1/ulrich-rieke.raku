#!/usr/bin/env raku

my @array = (1.2, 0.4, 0.1, 2.5);
my @combis = @array.combinations( 3 ) ;
my @sums = @combis.map( {[+] $_ } ) ;
if ( @sums.grep( { 1 < $_ < 2 }).elems > 0 ) {
  say 1 ;
}
else {
  say 0 ;
}
