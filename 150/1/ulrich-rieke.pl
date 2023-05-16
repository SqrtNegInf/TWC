#!/usr/bin/env perl
use v5.36;

my ($A, $B) = ('1234', '5678');
my @fibonacciWords = ($A , $B) ;
while ( length($fibonacciWords[-1]) < 51 ) {
  push @fibonacciWords , $fibonacciWords[-2] . $fibonacciWords[-1] ;
}
say substr( $fibonacciWords[-1] , 50 , 1 ) ;
