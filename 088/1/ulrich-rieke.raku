#!/usr/bin/env raku

my @array = <5 2 1 4 3>;
my $product = [*] @array.map( {.Int} ) ;
my $len = @array.elems ;
my @M ;
for ( 0 .. $len - 1 ) -> $i {
  @M.push( $product / @array[ $i ] ) ;
}
@M.say ;
