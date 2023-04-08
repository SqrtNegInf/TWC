#!/usr/bin/env perl
use v5.36.0;
use strict ;
use warnings ;
use feature 'say' ;

my %uniques ;
map { $uniques{$_}++ } 5,4,4,3 ;
my @unique = keys %uniques ;
my @sorted = sort { $b <=> $a } @unique ;
if ( scalar( @unique ) < 3 ) {
  say $sorted[0] ;
}
else {
  say $sorted[2] ;
}
