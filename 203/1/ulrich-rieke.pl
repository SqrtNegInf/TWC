#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use Algorithm::Combinatorics qw ( combinations ) ;

my @numbers = <9 0 1 2 3 4 5 6>;
my $specials = 0 ;
if ( scalar ( @numbers ) >= 4 ) {
  my $iter = combinations( \@numbers , 4 ) ;
  while ( my $p = $iter->next ) {
      if ( $p->[0] + $p->[1] + $p->[2] == $p->[3] ) {
    $specials++ ;
      }
  }
  say $specials ;
}
else {
  say "Enter at least 4 integers!" ;
}
