#!/usr/bin/env raku

my $line = 'abc1.20f1.345a';
while ( $line !~~ /^(\w **4 '.') ** 2 \w ** 4 $/ ) {
  say "Enter a Mac address in the form hhhh.hhhh.hhhh!" ;
  $line = $*IN.get ;
}
my @parts = split( /'.'/ , $line ) ;
my @chunks ;
for @parts -> $part {
  @chunks.push( $part.substr( 0 , 2 )) ;
  @chunks.push( $part.substr( 2 , 2 )) ;
}
say @chunks.join( ':' ) ;
