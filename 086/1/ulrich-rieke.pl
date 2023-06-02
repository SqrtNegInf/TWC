#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw( combinations ) ;

my $A = 7;
my @array = (10, 8, 12, 15, 5);
my @sorted = sort { $b <=> $a } @array ;
my $output = 0 ;
my $iter = combinations(\@sorted, 2 ) ;
while ( my $p = $iter->next ) {
  if ( $p->[0] - $p->[1] == $A ) {
      $output = 1 ;
      last ;
  }
}
say $output ;
