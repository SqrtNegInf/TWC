#!/usr/bin/env raku

my @matrix  =  <4 3 2 1>, <5 4 3 2>, <6 5 4 3>;
my @diagonals ;
my $len = @matrix.elems ;
for (0..$len - 1 ) -> $i {
  @diagonals.push( @matrix[$i][$i] ) ;
}
if ( @diagonals.grep( { $_ == @diagonals[0] } ).elems == $len ) {
  say "true" ;
}
else {
  say "false" ;
}
