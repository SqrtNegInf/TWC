#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub isPalindrome {
  my $N = shift ;
  return $N eq join( '' , reverse split( // , $N ) ) ;
}

my $N = 202;
say isPalindrome( $N ) ? 1 : 0 ;
