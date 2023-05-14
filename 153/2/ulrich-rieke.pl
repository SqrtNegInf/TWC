#!/usr/bin/env perl
use v5.36;
use List::Util qw ( sum product ) ;

sub factorial {
  my $number = shift ;
  if ( $number == 0 ) {
      return 1 ;
  }
  else {
      return product( 1 .. $number ) ;
  }
}

my $n = $ARGV[ 0 ] // 40585; 
my @digits = split( // , $n ) ;
if ( sum( map { factorial( $_ ) } @digits ) == $n ) {
  say 1 ;
}
else {
  say 0 ;
}
