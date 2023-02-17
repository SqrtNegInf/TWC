#!/usr/bin/env raku

# 2023-02-16 GH5209

sub MAIN( Int $n = 377) {
  my @fibos = ( 1 , 2 ) ;
  while ( @fibos[*-1] < $n ) {
      @fibos.push( @fibos[*-1] + @fibos[*-2] ) ;
  }
  for @fibos.combinations -> $combi {
      if ( (sum $combi) == $n ) {
     #if ( ([+] $combi) == $n ) {
    my $line = $combi.join( " + " ) ;
    $line ~= " = $n!" ;
    say $line ;
      }
  }
}
