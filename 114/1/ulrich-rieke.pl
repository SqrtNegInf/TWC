#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub isPalindrome {
  my $number = shift ;
  return $number eq join( '' , reverse split( // , $number ) ) ;
}

my $N = $ARGV[ 0 ] // 1234;
do {
  ++$N ;
} until ( isPalindrome( $N ) ) ;
say $N ;
