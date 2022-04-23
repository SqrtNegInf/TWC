#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use List::Util qw ( sum ) ;

my @numbers = (1, 3, 5, 7, 9);
my $len = scalar( @numbers ) ;

my $found = 0 ;
for my $i ( 1 .. $len - 2 ) {
  if ( sum ( @numbers[ 0 .. $i - 1] ) == sum ( @numbers[ $i + 1 .. $len - 1] )) {
      say $i ;
      $found = 1 ;
      last ;
  }
}
unless ($found) {
  say "-1 as no Equilibrium Index found." ;
}
