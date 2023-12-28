#!/usr/bin/env perl
use v5.36;

use List::Util qw ( min ) ;

my $line = "loveleetcode e";
chomp $line ;
my @parts = split( /\s+/ , $line ) ;
my $string = $parts[0] ;
my $letter = $parts[ 1 ] ;
my @letterpositions ;
my $pos = 0 ;
for my $current ( split( // , $string ) ) {
   if ( $current eq $letter ) {
      push @letterpositions , $pos ;
   }
   $pos++ ;
}
my @result ;
$pos = 0 ;
for my $current ( split( // ,  $string )) {
   if ( $current ne $letter ) {
      my @distances = map { abs( $pos - $_ ) } @letterpositions ;
      push @result , min( @distances ) ;
   }
   else {
      push @result , 0 ;
   }
   $pos++ ;
}
say ( "(" . join( ',' , @result) . ")" ) ;

