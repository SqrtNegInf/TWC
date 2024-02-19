#!/usr/bin/env perl
use v5.36;

my ($firstString , $secondString) = ('abcd', '1234');
my $len1 = length $firstString ;
my $len2 = length $secondString ;
my $merged ;
if ( $len1 != $len2 ) {
   my $smaller ;
   if ( $len1 < $len2 ) {
      $smaller = $len1 ;
   }
   else {
      $smaller = $len2 ;
   }
   for my $pos( 0..$smaller - 1 ) {
      $merged .= (substr( $firstString, $pos , 1 ) . substr( $secondString ,
	    $pos , 1 )) ;
   }
   if ( $len1 > $len2 ) {
      for my $pos( $smaller..$len1 - 1 ) {
	 $merged .= substr( $firstString , $pos , 1 ) ;
      }
   }
   else {
      for my $pos ( $smaller..$len2 - 1 ) {
	 $merged .= substr( $secondString, $pos , 1 ) ;
      }
   }
}
else {
   for my $pos (0..$len1 - 1) {
      $merged .= ( substr( $firstString, $pos , 1 ) . substr( 
	       $secondString, $pos , 1 ) ) ;
   }
}
say $merged ;
