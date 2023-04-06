#!/usr/bin/env perl

use v5.36;
use List::Util qw ( max ) ;

my @numbers = (10,8,5,4,3);
my @sorted = sort { $b <=> $a } @numbers ;
my @possible_h ;
for my $i ( 0..scalar( @sorted ) - 1 ) {
  if ( $sorted[ $i ] >= ( $i + 1 ) ) {
      push @possible_h , $i + 1 ;
  }
}
say max @possible_h ;
