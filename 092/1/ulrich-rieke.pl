#!/usr/bin/env perl
use v5.36;

my $A = 'aab' ;
my $B = 'ccd' ;
if ( length $A != length $B ) {
  print "0\n" ;
  exit( 0 ) ;
}
else {
  my %mapped_from ;
  my %mapped_to ;
  my $len = length $A ;
  for my $i (0 .. $len - 1 ) {
      $mapped_from{ substr( $A, $i , 1 ) } = substr( $B , $i , 1 ) ;
      $mapped_to{ substr( $B, $i , 1 ) }++ ;
  }
  if ( scalar keys %mapped_from == scalar keys %mapped_to ) {
      print "1\n" ;
  }
  else {
      print "0\n" ;
  }
}
