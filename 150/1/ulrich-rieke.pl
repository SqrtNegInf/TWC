#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

my ($A, $B) = ('1234', '5678');
#while ( length $B != length $A || $B !~ /\A\d+\z/ ) {
#  say ("second number string should be " . length( $A ) .
#    " characters long!") ;
#  say "digits only!" ;
#  $B = <STDIN> ;
#  chomp $B ;
#}
my @fibonacciWords = ($A , $B) ;
while ( length($fibonacciWords[-1]) < 51 ) {
  push @fibonacciWords , $fibonacciWords[-2] . $fibonacciWords[-1] ;
}
say substr( $fibonacciWords[-1] , 50 , 1 ) ;
