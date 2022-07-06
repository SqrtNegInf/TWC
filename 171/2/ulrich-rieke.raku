#!/usr/bin/env raku

my $f = sub ( Int $m ) { 5 * $m } ;
my $g = sub ( Int $n ) { sqrt( $n ) } ;

sub compose( $firstFunc , $secondFunc ) { return sub ( Int $x ) {
  $secondFunc( $firstFunc($x ) ) }} ;

my $h = compose( $f , $g ) ;
say $h( 6 ) ;
