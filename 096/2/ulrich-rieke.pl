#!/usr/bin/env perl
use v5.36;

use List::Util qw( min ) ;

sub levenshtein_dist {
  my $A = shift ;
  my $B = shift ;
  if ( length $A == 0 ) {
      return length $B ;
  }
  elsif ( length $B == 0 ) {
      return length $A ;
  }
  elsif ( substr( $A , 0 , 1 ) eq substr( $B, 0 , 1 ) ) {
      return levenshtein_dist( substr( $A , 1 ) , substr( $B, 1 ) ) ;
  }
  else {
      my $tailA = substr( $A , 1 ) ;
      my $tailB = substr( $B , 1 ) ;
      my @results ;
      push( @results , levenshtein_dist( $tailA, $B ) ) ;
      push( @results, levenshtein_dist( $A , $tailB ) ) ;
      push( @results, levenshtein_dist( $tailA , $tailB ) ) ;
      return 1 + min @results ;
  }
}

my ($A, $B) = ('kitten', 'sitting');
say levenshtein_dist( $A , $B ) ;
