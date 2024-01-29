#!/usr/bin/env raku

my @strings = "one.two.three";
my $sep = '.';
my @result ;
for @strings <-> $str {
   if ( $str ~~ /$sep/ ) {
      $str ~~ s:g/$sep/ / ;
      my @parts = $str.words ;
      for @parts -> $p { 
	 @result.push( $p ) ;
      }
   }
   else {
      @result.push( $str ) ;
   }
}
say ( "(" ~ @result.join( ' ' ) ~ ")" ) ;
