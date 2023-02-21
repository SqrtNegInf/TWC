#!/usr/bin/env raku

#say "Enter some integers , separated by blanks! Enter end to stop entry!" ;
#my $line = $*IN.get ;
#while ( $line ne "end" ) {
##  @numbers.push( |$line.words.map( {.Int} ) ) ;
#  $line = $*IN.get ;
#}
#say "Enter a row and a column number , separated by blanks!" ;
my @numbers = (1, 2, 3, 4, 5, 6);
my $line = '3 2';
my ( $r , $c ) = $line.words.map( {.Int} ) ;
if ( not ( @numbers.elems %% ( $r * $c ) ) ) {
  say 0 ;
}
else {
  if ( $r == 1 ) {
      say '(' ~ join( ',' , @numbers ) ~ ')' ;
  }
  else {
      say @numbers.rotor( $c ) ;
  }
}
