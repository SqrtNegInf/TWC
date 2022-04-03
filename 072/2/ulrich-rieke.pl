#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my $file = 'input.txt';
my $A = 3;
my $B = 6;
open( FH , "< $file") or die "Can't open file $file\n" ;
my $line ;
my $n = 1 ;
my @lines ;
while ( $line = <FH> ) {
  chomp $line ;
  if ( $n >= $A && $n <= $B ) {
      push( @lines , $line ) ;
  }
  if ( $n > $B ) {
      last ;
  }
  $n++ ;
}
map { say } @lines ;
